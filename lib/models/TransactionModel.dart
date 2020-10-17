class TransactionModel {
  String tx;
  String details;
  double amount;

//   getters

  TransactionModel({this.tx, this.details, this.amount});

  static TransactionModel fromJson(Map<String, dynamic> json) {
    final _user = json['withdraw'];
    return TransactionModel(
        tx: _user['trx'],
        details: _user['title'],
        amount: double.parse(_user['amount']));
  }
}
