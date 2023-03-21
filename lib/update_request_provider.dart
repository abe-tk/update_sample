import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:update_sample/emun/update_request_type.dart';
import 'package:update_sample/model/update_info_entity.dart';
import 'package:version/version.dart';

final updateRequesterProvider = FutureProvider<UpdateRequestType>((ref) async {
  /// インスタンスの作成
  final remoteConfig = FirebaseRemoteConfig.instance;
  // 本番環境
  // const interval = Duration(minutes: 12);
  // 開発
  const interval = Duration.zero;

  // シングルトンオブジェクトの取得
  // setConfigSettings()をawaitとしないとfetchAndActivate()でエラーとなるため、
  // remote_config_provider.dartで分けずに処理を行っている
  await remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: interval,
    ),
  );

  // 初期化・アクティベート済みのRemoteConfigインスタンス
  // final remoteConfig = ref.watch(remoteConfigProvider);
  await remoteConfig.fetchAndActivate();
  // 現在のアプリバージョンを取得するためにPackageInfoを利用
  final appPackageInfo = await PackageInfo.fromPlatform();
  // Firebase の RemoteConfigコンソールで指定したキーを使って値を取得
  final string = remoteConfig.getString('update_info');
  if (string.isEmpty) {
    return UpdateRequestType.not;
  }
  // JSON to Map
  final map = json.decode(string) as Map<String, Object?>;
  // Map(JSON) to Entity
  final entity = UpdateInfoEntity.fromJson(map);

  final enabledAt = entity.enabledAt;
  final requiredVersion = Version.parse(entity.requiredVersion);
  final currentVersion = Version.parse(appPackageInfo.version);
  // 現在のバージョンより新しいバージョンが指定されているか
  final hasNewVersion = requiredVersion > currentVersion;
  // 強制アップデート有効期間内かどうか
  final isEnabled = enabledAt.compareTo(DateTime.now()) < 0;

  if (!isEnabled || !hasNewVersion) {
    // 有効期間外、もしくは新しいバージョンは無い
    return UpdateRequestType.not;
  }
  return entity.canCancel
      ? UpdateRequestType.cancelable
      : UpdateRequestType.forcibly;
});
