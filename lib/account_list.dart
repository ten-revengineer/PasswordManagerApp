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
        leadingWidth: 400,
        leading:Row(
          children: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFFFFFFFF),
                  padding: EdgeInsets.zero,
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 5, right: 0),
                  child: Text('並替'),
                ),
                onPressed: () {},
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFFFFFFFF),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 0, right: 10),
                  child: Text('複数選択'),
                ),
                onPressed: () {},
              ),
              OutlinedButton(
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFFFFFFFF),
                  side: BorderSide(color: Colors.white, width: 1.0),
                ),
                child: const Text(
                  '　▼ すべて　',
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
                onPressed: () {},
            )
          ],
        ) ,
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
