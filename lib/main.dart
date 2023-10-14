import 'package:flutter/material.dart';
import 'package:passwordmanagerapp/account_list.dart';

void main() {
  // 最初に表示するWidget
  runApp(const PasswordManagerApp());
}

class PasswordManagerApp extends StatelessWidget {
  const PasswordManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 右上に表示される"debug"ラベルを消す
      debugShowCheckedModeBanner: false,
      // アプリ名
      title: 'Password Manager Application!',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: customSwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // リスト一覧画面を表示
      home: const AccountList(),
    );
  }
}

const MaterialColor customSwatch =
    MaterialColor(_mcgpalette0PrimaryValue, <int, Color>{
  50: Color(0xFFEAF3F8),
  100: Color(0xFFCAE2ED),
  200: Color(0xFFA7CEE1),
  300: Color(0xFF83BAD5),
  400: Color(0xFF69ACCC),
  500: Color(_mcgpalette0PrimaryValue),
  600: Color(0xFF4795BD),
  700: Color(0xFF3D8BB5),
  800: Color(0xFF3581AE),
  900: Color(0xFF256FA1),
});
const int _mcgpalette0PrimaryValue = 0xFF4E9DC3;
