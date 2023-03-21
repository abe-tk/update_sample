import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:update_sample/emun/update_request_type.dart';
import 'package:update_sample/update_request_provider.dart';

class VersionCheckPage extends ConsumerWidget {
  const VersionCheckPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('HOME')),
      body: SafeArea(
        child: Center(
          // FutureProviderなので、 `when` で loading, error, data のハンドリングができる
          child: ref.watch(updateRequesterProvider).when(
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => ErrorWidget(error),
                data: (requestType) =>
                    _ContentAndDialog(requestType: requestType),
              ),
        ),
      ),
    );
  }
}

class _ContentAndDialog extends StatelessWidget {
  const _ContentAndDialog({
    required this.requestType,
  });

  final UpdateRequestType requestType;

  @override
  Widget build(BuildContext context) {
    // ビルド後にダイアログを表示させるための記法
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (requestType != UpdateRequestType.not) {
        // 新しいアプリバージョンがある場合はダイアログを表示する
        showDialog<void>(
          context: context,
          // ダイアログの外をタップしても閉じられないようにする
          barrierDismissible: false,
          builder: (context) {
            return WillPopScope(
              // AndroidのBackボタンで閉じられないようにする
              onWillPop: () async => false,
              child: AlertDialog(
                title: const Text('最新の更新があります。\nアップデートをお願いします。'),
                actions: [
                  if (requestType == UpdateRequestType.cancelable)
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('キャンセル'),
                    ),
                  TextButton(
                    onPressed: () {
                      // 要追加: App Store or Google Play に飛ばす処理
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Jump to Store.')),
                      );
                      Navigator.of(context).pop();
                    },
                    child: const Text('アップデート'),
                  ),
                ],
              ),
            );
          },
        );
      }
    });
    return const Text('新しいバージョンがある場合はダイアログが表示されます。');
  }
}
