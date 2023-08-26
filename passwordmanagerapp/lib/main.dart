import 'package:flutter/material.dart';
import 'package:passwordmanagerapp/account_list.dart';


void main() {
  // 最初に表示するWidget
  runApp(PasswordManagerApp());
}

class PasswordManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 右上に表示される"debug"ラベルを消す
      debugShowCheckedModeBanner: false,
      // アプリ名
      title: 'Password Manager Application!',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // リスト一覧画面を表示
      home: AccountList(),
    );
  }
}