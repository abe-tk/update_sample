import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// remote configのprovider
final remoteConfigProvider = FutureProvider<FirebaseRemoteConfig>(
  (ref) async {
    final rc = FirebaseRemoteConfig.instance;

    // 例）flavorで開発環境ごとにintervalを分ける場合
    // final interval = flavor.isDev 
    //   ? Duration.zero 
    //   : const Duration(minutes: 12);
    const interval =  Duration.zero;

    // タイムアウトとフェッチのインターバル時間を設定する
    await rc.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: interval,
      ),
    );
    return rc;
  },
);
