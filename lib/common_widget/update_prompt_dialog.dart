import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:update_sample/emun/update_request_type.dart';
import 'package:update_sample/feature/util/shared_preferences/shared_preferences_repository.dart';

class UpdatePromptDialog extends ConsumerWidget {
  const UpdatePromptDialog({
    super.key,
    required this.updateRequestType,
  });

  final UpdateRequestType? updateRequestType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      // AndroidのBackボタンで閉じられないようにする
      onWillPop: () async => false,
      child: CupertinoAlertDialog(
        title: const Text('アプリが更新されました。\n\n最新バージョンのダウンロードをお願いします。'),
        actions: [
          if (updateRequestType == UpdateRequestType.cancelable)
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                await ref
                    .watch(sharedPreferencesRepositoryProvider)
                    .save<String>(
                      SharedPreferencesKey.cancelledUpdateDateTime,
                      DateTime.now().toString(),
                    );
              },
              child: const Text('キャンセル'),
            ),
          TextButton(
            onPressed: () {
              // App Store or Google Play に飛ばす処理
            },
            child: const Text('アップデートする'),
          ),
        ],
      ),
    );
  }
}
