// リスト一覧画面用Widget
import 'package:flutter/material.dart';
import 'package:passwordmanagerapp/account_mst.dart';

import 'main.dart';

// リスト一覧画面用Widget
class AccountRegist extends StatefulWidget {
  const AccountRegist({super.key});

  @override
  State<AccountRegist> createState() => _AccountRegistState();
}

class _AccountRegistState extends State<AccountRegist> {
  // アカウントデータ
  AccountMst account = AccountMst.empty();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFFCAE2ED),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        margin: const EdgeInsets.only(top: 15),
        child: Column(children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('✕',
                      style: TextStyle(color: customSwatch, fontSize: 20)),
                ),
                const Text('パスワードの登録',
                    style: TextStyle(
                        color: customSwatch, fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(account);
                  },
                  child:
                      const Text('登録', style: TextStyle(color: customSwatch)),
                ),
              ]),
          Container(
              margin: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 40),
              height: 500,
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                Container(
                  color: customSwatch[50],
                  child:
                      // タイトル、ID,パスワードの入力
                      TextField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Center(
                          child: Text('パスワードのタイトル',
                              style: TextStyle(color: Colors.grey)),
                        )),
                    // 入力されたテキストの値を受け取る（valueが入力されたテキスト）
                    onChanged: (String value) {
                      // データを変更

                      account.title = value;
                    },
                  ),
                ),
                const SizedBox(height: 1),
                Container(
                  color: customSwatch[50],
                  child:
                      // タイトル、ID,パスワードの入力
                      TextField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Center(
                          child: Text('アカウント・ID',
                              style: TextStyle(color: Colors.grey)),
                        )),
                    // 入力されたテキストの値を受け取る（valueが入力されたテキスト）
                    onChanged: (String value) {
                      // データを変更

                      account.accountId = value;
                    },
                  ),
                ),
                const SizedBox(height: 1),
                Container(
                  color: customSwatch[50],
                  child:
                      // タイトル、ID,パスワードの入力
                      TextField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Center(
                          child: Text('パスワード',
                              style: TextStyle(color: Colors.grey)),
                        )),
                    // 入力されたテキストの値を受け取る（valueが入力されたテキスト）
                    onChanged: (String value) {
                      // データを変更

                      account.password = value;
                    },
                  ),
                ),
              ]))),
          Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
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
              )),
        ]));
  }
}
