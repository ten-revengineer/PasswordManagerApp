import 'package:flutter/material.dart';
import 'package:passwordmanagerapp/account_regist.dart';
import 'package:passwordmanagerapp/account_mst.dart';
import 'package:flutter/services.dart';

import 'account_detail.dart';

// リスト一覧画面用Widget
class AccountList extends StatefulWidget {
  @override
  _AccountListState createState() => _AccountListState();
}

// リスト一覧画面用Widget
class _AccountListState extends State<AccountList> {
  // アカウントデータ
  List<AccountMst> accountList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('パスワード一覧'),
        leading: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFFFFFFFF),
          ),
          child: const Text('並替'),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: '検索',
            onPressed: () {
              // ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: accountList.length,
        itemBuilder: (context, index) {
          AccountMst account;
          account = accountList[index];
          return Dismissible(
              onDismissed: (direction) {
                setState(() {
                  accountList.removeAt(index);
                });
              },
              background: Container(
                color: Colors.red,
                alignment: AlignmentDirectional.centerEnd,
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              direction: DismissDirection.endToStart,
              key: UniqueKey(),
              child: Column(children: [
                ListTile(
                    title: Text(account.title),
                    subtitle:
                        Text(account.accountId + "  /  " + account.password),
                    onTap: () async {
                      AccountMst accountMst = await Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          // 遷移先の画面としてリスト追加画面を指定
                          return AccountDetail(account);
                        }),
                      );
                      if (accountMst != null) {
                        setState(() {
                          accountList[index] = accountMst;
                        });
                      }
                    }),
                Row(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () async {
                        final data =
                            ClipboardData(text: accountList[index].accountId);
                        await Clipboard.setData(data);
                      },
                      child: Text("アカウントをコピー"),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final data =
                            ClipboardData(text: accountList[index].password);
                        await Clipboard.setData(data);
                      },
                      child: Text("パスワードをコピー"),
                    ),
                  ],
                ),
              ]));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // "push"で新規画面に遷移
          final newAccount = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // 遷移先の画面としてリスト追加画面を指定
              return AccountRegist();
            }),
          );
          if (newAccount != null) {
            setState(() {
              accountList.add(newAccount);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
