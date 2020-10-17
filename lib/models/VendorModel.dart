class VendorModel {
  String firstname;
  int mobile;
  String lastname;

//   getters

  VendorModel({this.firstname, this.lastname, this.mobile});

  static VendorModel fromJson(Map<String, dynamic> json) {
    final _user = json['vendor'];
    return VendorModel(
        firstname: _user['firstname'],
        lastname: _user['lastname'],
        mobile: int.parse(_user['mobile']));
  }
}
