import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:update_sample/common_widget/update_prompt_dialog.dart';
import 'package:update_sample/emun/update_request_type.dart';
import 'package:update_sample/feature/util/forced_update/update_request_provider.dart';

class TopPage extends ConsumerWidget {
  const TopPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // updateの確認
    final updateRequestType = ref.watch(updateRequesterProvider).value;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // アップデートがあった場合
      if (updateRequestType == UpdateRequestType.cancelable ||
          updateRequestType == UpdateRequestType.forcibly) {
        // 新しいバージョンがある場合はダイアログを表示する
        // barrierDismissible はダイアログ表示時の背景をタップしたときにダイアログを閉じてよいかどうか
        // updateの案内を勝手に閉じて欲しくないのでbarrierDismissibleはfalse
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return UpdatePromptDialog(
              updateRequestType: updateRequestType,
            );
          },
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('TOP PAGE')),
      body: const SafeArea(
        child: Center(
          child: Text('update_sample'),
        ),
      ),
    );
  }
}
