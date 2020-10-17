class WithdrawalModel {
  String tx;
  int status;
  int type;
  int method;
  double amount;

//   getters

  WithdrawalModel({this.tx, this.status, this.type, this.method, this.amount});

  static WithdrawalModel fromJson(Map<String, dynamic> json) {
    final _user = json['withdraw'];
    return WithdrawalModel(
        tx: _user['trx'],
        type: int.parse(_user['type']),
        method: int.parse(_user['method']),
        status: int.parse(_user['status']),
        amount: double.parse(_user['amount']));
  }
}
