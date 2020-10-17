import 'package:flutter/material.dart';
import 'package:tronnshare/models/CouponModel.dart';
import 'package:tronnshare/models/ReferralModel.dart';
import 'package:tronnshare/models/SpillOverModel.dart';
import 'package:tronnshare/models/TransactionModel.dart';
import 'package:tronnshare/models/UserModel.dart';
import 'package:tronnshare/models/WithdrawalModel.dart';
import 'package:tronnshare/services/UserService.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }
enum StatusLoading { Loading, Finish, Start }

class UserProvider extends ChangeNotifier {
  Status status = Status.Uninitialized;
  StatusLoading loadingStatus = StatusLoading.Start;
  UserModel userModel;
  String resMessage;
  bool userClick = false;
  String current_access_token;
  SpillOverModel spillOverModel;
  CouponModel couponModel;
  TransactionModel transactionModel;
  ReferralModel referralModel;
  String errorMessage;
  double currentBalance;
  double currentSpillOver;
  UserService _userService = UserService();
  List<WithdrawalModel> withdrawalList = [];
  List<TransactionModel> transactionList = [];
  List<CouponModel> couponList = [];
  List<ReferralModel> referralList = [];

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController coupon = TextEditingController();
  TextEditingController referral = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController newcoupon = TextEditingController();
  //
  String withdrawtype;

  TextEditingController amount = TextEditingController();
  TextEditingController tronwallet = TextEditingController();
  TextEditingController bankname = TextEditingController();
  TextEditingController bankacctno = TextEditingController();
  TextEditingController bankacctname = TextEditingController();

  Future<bool> userLogIn() async {
    try {
      status = Status.Authenticating;
      notifyListeners();
      userModel = await _userService.userSignIn(username.text, password.text);
      current_access_token = userModel.accesstoken;
      currentBalance = userModel.walletbalance;
      currentSpillOver = userModel.spilloverbalance;
      await userDetails();
      SharedPreferences.getInstance().then((sharedPref) {
        sharedPref.setString("access_token", current_access_token);
      });
      return true;
    } catch (e) {
      status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> userDetails() async {
    try {
      spillOverModel =
          await _userService.getTodaySpillOver(current_access_token);
      withdrawalList =
          await _userService.getWithdrawalList(current_access_token);
      transactionList =
          await _userService.getTransactionList(current_access_token);
      referralList = await _userService.getReferralList(current_access_token);
      couponList = await _userService.getCouponList(current_access_token);
      status = Status.Uninitialized;
      notifyListeners();
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> userChangePassword() async {
    try {
      loadingStatus = StatusLoading.Loading;
      notifyListeners();
      await _userService.changePassword(newpassword.text, current_access_token);
      loadingStatus = StatusLoading.Finish;
      notifyListeners();
      return true;
    } catch (e) {
      loadingStatus = StatusLoading.Finish;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> userChangePlan() async {
    try {
      loadingStatus = StatusLoading.Loading;
      notifyListeners();
      final res =
          await _userService.changePlan(newcoupon.text, current_access_token);
      transactionList =
          await _userService.getTransactionList(current_access_token);
      loadingStatus = StatusLoading.Finish;
      resMessage = res;
      notifyListeners();
      return true;
    } catch (e) {
      loadingStatus = StatusLoading.Finish;
      resMessage = e.message;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> userGetSpillOver(id) async {
    try {
      loadingStatus = StatusLoading.Loading;
      notifyListeners();
      final res = await _userService.getSpillOver(id, current_access_token);
      resMessage = res["message"];
      currentBalance = res["new_balance"].toDouble();
      currentSpillOver = double.parse(res["new_spill_over"]);
      loadingStatus = StatusLoading.Finish;
      notifyListeners();
      return true;
    } catch (e) {
      resMessage = e.message;
      loadingStatus = StatusLoading.Finish;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> userLogout() async {
    try {
      await _userService.logOut(current_access_token);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> userRegister() async {
    try {
      status = Status.Authenticating;
      notifyListeners();
      await _userService.userSignUp(
          username.text,
          password.text,
          firstname.text,
          lastname.text,
          coupon.text,
          referral.text,
          mobile.text,
          email.text);
      status = Status.Uninitialized;
      notifyListeners();
      return true;
    } catch (e) {
      status = Status.Unauthenticated;
      notifyListeners();
      errorMessage = e.message;
      return false;
    }
  }

  Future<bool> userWithdrawLocal() async {
    loadingStatus = StatusLoading.Loading;
    notifyListeners();
    try {
      final res = await _userService.withdrawLocallly(
          withdrawtype,
          amount.text,
          bankacctno.text,
          bankacctname.text,
          bankname.text,
          current_access_token);
      resMessage = res["message"];
      currentBalance = res["new_balance"].toDouble();
      currentSpillOver = double.parse(res["new_spill_over"]);
      withdrawalList =
          await _userService.getWithdrawalList(current_access_token);
      transactionList =
          await _userService.getTransactionList(current_access_token);
      loadingStatus = StatusLoading.Finish;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      loadingStatus = StatusLoading.Finish;
      resMessage = e.message;
      notifyListeners();
      return false;
    }
  }

  Future<bool> userWithdrawTron() async {
    loadingStatus = StatusLoading.Loading;
    notifyListeners();
    try {
      final res = await _userService.withdrawTron(
          withdrawtype, amount.text, tronwallet.text, current_access_token);
      resMessage = res["message"];
      currentBalance = res["new_balance"].toDouble();
      currentSpillOver = double.parse(res["new_spill_over"]);
      print(userModel.walletbalance);
      withdrawalList =
          await _userService.getWithdrawalList(current_access_token);
      transactionList =
          await _userService.getTransactionList(current_access_token);
      loadingStatus = StatusLoading.Finish;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      resMessage = e.message;
      loadingStatus = StatusLoading.Finish;
      notifyListeners();
      return false;
    }
  }

  void changeType(value) {
    withdrawtype = value.toString();
    notifyListeners();
  }

  void clearController() {
    username.text = "";
    password.text = "";
    email.text = "";
    firstname.text = "";
    lastname.text = "";
    coupon.text = "";
    mobile.text = "";
    referral.text = "";
    newpassword.text = "";
    newcoupon.text = "";
  }

  void clearWithdrawController() {
    amount.text = "";
    bankacctname.text = "";
    bankacctno.text = "";
    bankname.text = "";
    tronwallet.text = "";
    withdrawtype = null;
  }

  void userClickShare(bool isClick) {
    userClick = isClick;
    notifyListeners();
  }
}
