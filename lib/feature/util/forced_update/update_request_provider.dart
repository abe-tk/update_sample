import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:update_sample/emun/update_request_type.dart';
import 'package:update_sample/feature/util/forced_update/model/update_info.dart';
import 'package:update_sample/feature/util/forced_update/remote_config_provider.dart';
import 'package:update_sample/feature/util/shared_preferences/shared_preferences_repository.dart';
import 'package:version/version.dart';

final updateRequesterProvider = FutureProvider<UpdateRequestType>((ref) async {
  final remoteConfig = await ref.watch(remoteConfigProvider.future);
  await remoteConfig.fetchAndActivate();
  // Firebase の RemoteConfigコンソールで指定したキーを使って値を取得
  final string = remoteConfig.getString('update_info');
  if (string.isEmpty) {
    return UpdateRequestType.not;
  }
  // JSON to Map
  final map = json.decode(string) as Map<String, Object?>;
  // Map(JSON) to Entity
  final updateInfo = UpdateInfo.fromJson(map);

  // 現在のアプリケーションを取得
  final appPackageInfo = await PackageInfo.fromPlatform();
  final appVer = Version.parse(appPackageInfo.version);

  // Remote Configから取得した値
  final latestVer = Version.parse(updateInfo.latestVer);
  final requiredVer = Version.parse(updateInfo.requiredVer);
  final enabledAt = updateInfo.enabledAt;

  // shared_preferencesで保存ている「キャンセル」を押下した日時を取得
  final cancelledUpdateDateTime = await ref
      .watch(sharedPreferencesRepositoryProvider)
      .fetch<String>(SharedPreferencesKey.cancelledUpdateDateTime);

  // 現在のバージョンより新しいバージョンが指定されているか
  final hasNewVersion = latestVer > appVer || requiredVer > appVer;

  // ダイアログ表示が有効期限内か
  late bool isEnabled;
  if (cancelledUpdateDateTime != null) {
    // Remote Configで設定した日時が、キャンセルボタンを押した日時より後 かつ
    //   Remote Configで設定した日時が、現在日時がより前
    isEnabled = enabledAt.isAfter(DateTime.parse(cancelledUpdateDateTime)) &&
        enabledAt.isBefore(DateTime.now());
  } else {
    isEnabled = true;
  }

  if (!isEnabled || !hasNewVersion) {
    return UpdateRequestType.not;
  }
  return latestVer > appVer && requiredVer <= appVer
      ? UpdateRequestType.cancelable
      : UpdateRequestType.forcibly;
});
