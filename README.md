# update_sample

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# update_sample



# memo

■ shared_prefarenceで保持している日時の値がnullの場合且つ、アップデートするバージョンがあった場合に、ダイアログを表示する処理ができていなかった

// Remote Configで設定した日付が、キャンセルボタンを押した日時よりも後かどうか
final isEnabled = cancelledUpdateDateTime != null &&
    enabledAt.isAfter(DateTime.parse(cancelledUpdateDateTime));

if (!isEnabled || !hasNewVersion) {
  // Remote Configで設定した日付以降にキャンセルボタンを押した、もしくは新しいバージョンは無い
  return UpdateRequestType.not;
}

→ 上記コードの問題点：cancelledUpdateDateTimeがnullの場合、isEnabledがfalseになるため、UpdateRequestType.notが返りダイアログが表示されない。



■ Remote Configで設定した日時が現在日時より後の場合に、ダイアログを表示しない処理が考慮できていなかった
→ 問題点：Remote Configで設定した日時が未来日時だった場合、キャンセルボタンを押下してもダイアログの非表示ができなくなるケースが起きる。
　　　　　 またenabledAtを現在日時より過去とした場合には、キャンセルボタンを押下した日時がenabledAtの日時を過ぎているケースが発生するため、ダイアログが表示されずアップデートを促せなくなる。

　例）enabledAt：2023/04/01
　　　cancelledUpdateDateTime：2023/03/01
　　　latestVer：2.0.0
　　　appVer：1.0.0

　　　2023/03/01~2023/03/31の間にキャンセルボタンを押下しても、hasNewVersionはtrueとなるため、
　　　以下コードでUpdateRequestType.notが返らずダイアログが表示される

　　　if (!isEnabled || !hasNewVersion) {
  　　　return UpdateRequestType.not;
　　　}



→ 以下が修正後のコード

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