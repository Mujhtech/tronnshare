class ReferralModel {
  String firstname;
  String lastname;
  int level;
  double balance;

//   getters

  ReferralModel({this.lastname, this.firstname, this.level, this.balance});

  static ReferralModel fromJson(Map<String, dynamic> json) {
    final _user = json['withdraw'];
    return ReferralModel(
        firstname: _user['firstname'],
        lastname: _user['lastname'],
        level: int.parse(_user['planid']),
        balance: double.parse(_user['balance']));
  }
}
