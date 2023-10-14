class AccountMst {
  String accountId;
  String password;
  String title;

  AccountMst(this.accountId, this.password, this.title);
  AccountMst.empty()
      : accountId = '',
        password = '',
        title = '';

}