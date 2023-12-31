import 'package:flutter/material.dart';

import 'account_mst.dart';

class AccountDetail extends StatefulWidget {
  final AccountMst accountMst;

  const AccountDetail(this.accountMst, {super.key});

  @override
  State<AccountDetail> createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('詳細画面')),
      body: Container(
        // 余白を付ける
        padding: const EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 8),
            // タイトル、ID,パスワードの入力
            TextField(
              controller: TextEditingController(text: widget.accountMst.title),
              onChanged: (String value) {
                widget.accountMst.title = value;
              },
            ),
            TextField(
              controller:
                  TextEditingController(text: widget.accountMst.accountId),
              onChanged: (String value) {
                widget.accountMst.accountId = value;
              },
            ),
            TextField(
              controller:
                  TextEditingController(text: widget.accountMst.password),
              onChanged: (String value) {
                widget.accountMst.password = value;
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
                  Navigator.of(context).pop(widget.accountMst);
                },
                child:
                    const Text('修正する', style: TextStyle(color: Colors.white)),
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
          ],
        ),
      ),
    );
  }
}
