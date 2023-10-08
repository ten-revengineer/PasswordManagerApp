// リスト一覧画面用Widget
import 'package:flutter/material.dart';
import 'package:passwordmanagerapp/account_mst.dart';

// リスト一覧画面用Widget
class AccountRegist extends StatefulWidget {
  @override
  _AccountRegistState createState() => _AccountRegistState();
}

class _AccountRegistState extends State<AccountRegist> {
  // アカウントデータ
  AccountMst account = AccountMst();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("テスト"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.back_hand),
              tooltip: '戻る',
              onPressed: () {
                // "pop"で前の画面に戻る
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: Container(
            // 余白を付ける
            padding: const EdgeInsets.all(64),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 8),
                  // タイトル、ID,パスワードの入力
                  TextField(
                    // 入力されたテキストの値を受け取る（valueが入力されたテキスト）
                    onChanged: (String value) {
                      // データを変更

                      account.title = value;
                    },
                  ),
                  TextField(
                    // 入力されたテキストの値を受け取る（valueが入力されたテキスト）
                    onChanged: (String value) {
                      // データを変更

                      account.accountId = value;
                    },
                  ),
                  TextField(
                    // 入力されたテキストの値を受け取る（valueが入力されたテキスト）
                    onChanged: (String value) {
                      // データを変更

                      account.password = value;
                    },
                  ),

                  const SizedBox(height: 8),
                  SizedBox(
                    // 横幅いっぱいに広げる
                    width: double.infinity,
                    // リスト追加ボタン
                    child: ElevatedButton(
                      onPressed: () {
                        // "pop"で前の画面に戻る
                        // "pop"の引数から前の画面にデータを渡す
                        Navigator.of(context).pop(account);
                      },
                      child: const Text('パスワード登録',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    // 横幅いっぱいに広げる
                    width: double.infinity,
                    // キャンセルボタン
                    child: TextButton(
                      // ボタンをクリックした時の処理
                      onPressed: () {
                        // "pop"で前の画面に戻る
                        Navigator.of(context).pop();
                      },
                      child: const Text('キャンセル'),
                    ),
                  ),
                ])));
  }
}
