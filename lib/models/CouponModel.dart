class CouponModel {
  String code;
  int status;

//   getters

  CouponModel({this.status, this.code});

  static CouponModel fromJson(Map<String, dynamic> json) {
    final _user = json['coupon'];
    return CouponModel(
        code: _user['coupon'], status: int.parse(_user['status']));
  }
}
