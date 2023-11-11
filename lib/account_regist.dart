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
  bool _isObscure = true;

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
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  '✕',
                  style: TextStyle(color: customSwatch, fontSize: 20),
                ),
              ),
              const Text(
                'パスワードの登録',
                style:
                    TextStyle(color: customSwatch, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(account);
                },
                child: const Text(
                  '登録',
                  style: TextStyle(color: customSwatch),
                ),
              ),
            ],
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 40),
            height: 500,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          color: customSwatch[50],
                          child: TextField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              label: Center(
                                child: Text(
                                  'パスワードのタイトル',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            // 入力されたテキストの値を受け取る（valueが入力されたテキスト）
                            onChanged: (String value) {
                              // データを変更
                              account.title = value;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 1),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBVpMw6hVH4re8VfuG2KpZPDd2snPAxzSpUOlFSNqYEw&s',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 1),
                  Container(
                    color: customSwatch[50],
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Center(
                          child: Text(
                            'アカウント・ID',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      // 入力されたテキストの値を受け取る（valueが入力されたテキスト）
                      onChanged: (String value) {
                        // データを変更
                        account.accountId = value;
                      },
                    ),
                  ),
                  const SizedBox(height: 1),
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          color: customSwatch[50],
                          child: TextFormField(
                            obscureText: _isObscure,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              label: const Center(
                                child: Text(
                                  'パスワード',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(
                                    () {
                                      _isObscure = !_isObscure;
                                    },
                                  );
                                },
                              ),
                            ),

                            // 入力されたテキストの値を受け取る（valueが入力されたテキスト）
                            onChanged: (String value) {
                              // データを変更
                              account.password = value;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 1),
                      Container(
                        width: 50,
                        height: 50,
                        decoration:const BoxDecoration(
                          color: Colors.grey,
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            '設定',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              ),
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration:const BoxDecoration(
                          color: Color.fromARGB(189, 3, 77, 129),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            '自動作成',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8.5,
                              ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 1),
                  Container(
                    color: customSwatch[50],
                    height: 50,
                    width: double.infinity,
                    child: TextButton(
                      child: const Text('すべて'),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Container(
                    color: customSwatch[50],
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Center(
                          child: Text(
                            'ログイン画面のURL',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      onChanged: (String value) {},
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        color: customSwatch[50],
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: IconButton(
                            icon: const Icon(
                              Icons.camera_alt_outlined,
                              size: 60,
                              color: customSwatch,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      const SizedBox(width: 1),
                      Flexible(
                        child: Container(
                          height: 100,
                          color: customSwatch[50],
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              label: Center(
                                child: Text(
                                  'メモを入力',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            onChanged: (String value) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
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
                child: const Text(
                  'パスワード登録',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
