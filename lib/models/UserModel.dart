class UserModel {
  int id;
  int planid;
  int mobile;
  int isvendor;
  int position;
  int positionid;

  String firstname;
  String lastname;
  String email;
  String image;
  String username;
  String accesstoken;
  String bankname;
  String bankacctname;
  String bankacctno;

  double walletbalance;
  double spilloverbalance;

  UserModel(
      {this.id,
      this.planid,
      this.mobile,
      this.isvendor,
      this.position,
      this.positionid,
      this.firstname,
      this.lastname,
      this.email,
      this.image,
      this.username,
      this.accesstoken,
      this.bankname,
      this.bankacctname,
      this.bankacctno,
      this.walletbalance,
      this.spilloverbalance});

  static UserModel fromJson(Map<String, dynamic> json) {
    final _user = json['user'];
    return UserModel(
      id: _user['id'],
      planid: int.parse(_user['plan_id']),
      position: int.parse(_user['position']),
      positionid: int.parse(_user['position_id']),
      firstname: _user['firstname'],
      lastname: _user['lastname'],
      username: _user['username'],
      image: _user['image'],
      email: _user['email'],
      mobile: int.parse(_user['mobile']),
      walletbalance: double.parse(_user['balance']),
      spilloverbalance: double.parse(_user['spill_over']),
      isvendor: int.parse(_user['is_vendor']),
      accesstoken: json['access_token'],
      bankacctname: _user['bank_ac_name'],
      bankname: _user['bank_ac'],
      bankacctno: _user['bank_ac_no'],
    );
  }
}
