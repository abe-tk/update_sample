import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends HookWidget {
  const MyHomePage({super.key});

  Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  @override
  Widget build(BuildContext context) {
    final appVersion = useState('nonData');

    useEffect(
      () {
        /// Firebase Remote Configの初期化
        FirebaseRemoteConfigService().initRemoteConfig();
        return null;
      },
      [],
    );

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('RemoteConfig:${FirebaseRemoteConfig.instance.getString('required_version')}'),
            Text('AppVersion:${appVersion.value}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => appVersion.value = await getAppVersion(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// Firebase Remote Configの初期設定
class FirebaseRemoteConfigService {
  Future<void> initRemoteConfig() async {
    /// インスタンスの作成
    final remoteConfig = FirebaseRemoteConfig.instance;

    /// シングルトンオブジェクトの取得
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(minutes: 5),
      ),
    );

    /// アプリ内デフォルトパラメータ値の設定
    // await remoteConfig.setDefaults(const {
    //   'example_param': '0',
    // });

    /// 値をフェッチ
    await remoteConfig.fetchAndActivate();
  }
}
