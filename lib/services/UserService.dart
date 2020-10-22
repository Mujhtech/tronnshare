import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tronnshare/models/CouponModel.dart';
import 'package:tronnshare/models/ReferralModel.dart';
import 'package:tronnshare/models/SpillOverModel.dart';
import 'package:tronnshare/models/TransactionModel.dart';
import 'package:tronnshare/models/UserModel.dart';
import 'package:tronnshare/models/WithdrawalModel.dart';
import 'package:tronnshare/services/HttpException.dart';

class UserService {
  static const baseUrl = 'https://tronnshare.com/api';
  final client = http.Client();
  String accesstoken;
  UserModel userModel;
  SpillOverModel spillOverModel;

  Future<UserModel> userSignIn(String username, String password) async {
    final url = '$baseUrl/login';
    String jsonRequest =
        '{"username": "' + username + '", "password": "' + password + '"}';
    final res = await client.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonRequest);
    final userJson = json.decode(res.body);
    if (res.statusCode != 200) {
      throw HTTPException(res.statusCode, userJson["message"]);
    }
    return UserModel.fromJson(userJson);
  }

  Future<Null> userSignUp(
      String username,
      String password,
      String firstname,
      String lastname,
      String coupon,
      String referral,
      String mobile,
      String email) async {
    final url = '$baseUrl/register';
    String jsonRequest = '{"username": "' +
        username +
        '", "password": "' +
        password +
        '", "firstname": "' +
        firstname +
        '", "lastname": "' +
        lastname +
        '", "mobile": "' +
        mobile +
        '", "coupon_code": "' +
        coupon +
        '", "email": "' +
        email +
        '", "ref_id": "' +
        referral +
        '"}';
    final res = await client.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonRequest);
    final userJson = json.decode(res.body);
    print(res.body);
    if (res.statusCode != 200) {
      throw HTTPException(res.statusCode, userJson["message"]);
    }
  }

  Future<String> changePassword(String password, String accesstokenUser) async {
    final url = '$baseUrl/change-password';
    String jsonRequest = '{"password": "' + password + '"}';
    Map<String, String> jsonHeader = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $accesstokenUser",
    };
    final res = await client.post(url, headers: jsonHeader, body: jsonRequest);
    final userJson = json.decode(res.body);
    if (res.statusCode != 200) {
      throw HTTPException(res.statusCode, userJson["message"]);
    }

    return userJson["message"];
  }

  Future<Map<String, dynamic>> getSpillOver(
      int id, String accesstokenUser) async {
    final url = '$baseUrl/get-spill-over/$id';
    Map<String, String> jsonHeader = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $accesstokenUser",
    };
    final res = await client.get(
      url,
      headers: jsonHeader,
    );
    print(res.body);
    final userJson = json.decode(res.body);
    if (res.statusCode != 200) {
      throw HTTPException(res.statusCode, userJson["message"]);
    }

    print(userJson);

    return userJson;
  }

  Future<String> changePlan(String coupon, String accesstokenUser) async {
    final url = '$baseUrl/upgrade-plan';
    String jsonRequest = '{"coupon_code": "' + coupon + '"}';
    Map<String, String> jsonHeader = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $accesstokenUser",
    };
    final res = await client.post(url, headers: jsonHeader, body: jsonRequest);
    final userJson = json.decode(res.body);
    if (res.statusCode != 200) {
      throw HTTPException(res.statusCode, userJson["message"]);
    }

    return userJson["message"];
  }

  Future<Map<String, dynamic>> withdrawLocallly(
      String type,
      String amount,
      String bankacctno,
      String bankacctname,
      String bankname,
      String accesstokenUser) async {
    final url = '$baseUrl/withdraw-local';

    String jsonRequest = '{"type": "' +
        type +
        '", "amount": "' +
        amount +
        '", "bankacctno": "' +
        bankacctno +
        '", "bankacctname": "' +
        bankacctname +
        '", "bankname": "' +
        bankname +
        '"}';
    Map<String, String> jsonHeader = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $accesstokenUser",
    };
    final res = await client.post(url, headers: jsonHeader, body: jsonRequest);
    final userJson = json.decode(res.body);
    if (res.statusCode != 200) {
      throw HTTPException(res.statusCode, userJson["message"]);
    }
    return userJson;
  }

  Future<Map<String, dynamic>> withdrawTron(String type, String amount,
      String tronwallet, String accesstokenUser) async {
    final url = '$baseUrl/withdraw-tron';

    String jsonRequest = '{"type": "' +
        type +
        '", "amount": "' +
        amount +
        '", "tronwallet": "' +
        tronwallet +
        '"}';
    Map<String, String> jsonHeader = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $accesstokenUser",
    };

    final res = await client.post(url, headers: jsonHeader, body: jsonRequest);
    final userJson = json.decode(res.body);
    print(res.body);
    if (res.statusCode != 200) {
      throw HTTPException(res.statusCode, userJson["message"]);
    }

    return userJson;
  }

  Future<List<WithdrawalModel>> getWithdrawalList(
      String accesstokenUser) async {
    List<WithdrawalModel> withdrawalList = [];
    final url = '$baseUrl/withdrawals';
    Map<String, String> jsonHeader = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $accesstokenUser",
    };
    final res = await client.get(url, headers: jsonHeader);
    final userJson = json.decode(res.body);
    print(res.body);
    if (res.statusCode != 200) {
      throw HTTPException(res.statusCode, userJson['message']);
    }
    for (final item in userJson['withdraw']) {
      withdrawalList.add(WithdrawalModel(
        tx: item['trx'],
        amount: double.parse(item['amount']),
        type: int.parse(item['type']),
        status: int.parse(item['status']),
        method: int.parse(item['method_id']),
      ));
    }
    return withdrawalList;
  }

  Future<List<TransactionModel>> getTransactionList(
      String accesstokenUser) async {
    List<TransactionModel> transactionList = [];
    final url = '$baseUrl/transactions';
    Map<String, String> jsonHeader = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $accesstokenUser",
    };
    final res = await client.get(url, headers: jsonHeader);
    final userJson = json.decode(res.body);
    print(res.body);
    if (res.statusCode != 200) {
      throw HTTPException(res.statusCode, userJson['message']);
    }
    for (final item in userJson['transaction']) {
      transactionList.add(TransactionModel(
        tx: item['trx'],
        amount: double.parse(item['amount']),
        details: item['title'],
      ));
    }
    return transactionList;
  }

  Future<List<CouponModel>> getCouponList(String accesstokenUser) async {
    List<CouponModel> couponList = [];
    final url = '$baseUrl/coupons';
    Map<String, String> jsonHeader = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $accesstokenUser",
    };
    final res = await client.get(url, headers: jsonHeader);
    final userJson = json.decode(res.body);
    print(res.body);
    if (res.statusCode != 200) {
      throw HTTPException(res.statusCode, userJson['message']);
    }
    for (final item in userJson['coupons']) {
      couponList.add(CouponModel(
        code: item['coupon_code'],
        status: int.parse(item['is_used']),
      ));
    }
    return couponList;
  }

  Future<List<ReferralModel>> getReferralList(String accesstokenUser) async {
    List<ReferralModel> referralList = [];
    final url = '$baseUrl/myreferrals';
    Map<String, String> jsonHeader = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $accesstokenUser",
    };
    final res = await client.get(url, headers: jsonHeader);
    final userJson = json.decode(res.body);
    print(res.body);
    if (res.statusCode != 200) {
      throw HTTPException(res.statusCode, userJson['message']);
    }
    for (final item in userJson['referrals']) {
      referralList.add(ReferralModel(
        firstname: item['trx'],
        lastname: item['status'],
        balance: double.parse(item['balance']),
        level: int.parse(item['planid']),
      ));
    }
    return referralList;
  }

  Future<SpillOverModel> getTodaySpillOver(String accesstokenUser) async {
    final url = '$baseUrl/today-spill-over';
    Map<String, String> jsonHeader = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $accesstokenUser",
    };
    final res = await client.get(url, headers: jsonHeader);
    final userJson = json.decode(res.body);
    print(res.body);
    if (res.statusCode != 200) {
      throw HTTPException(res.statusCode, userJson['message']);
    }
    return SpillOverModel.fromJson(userJson);
  }

  Future<bool> logOut(String accesstokenUser) async {
    final url = '$baseUrl/logout';
    Map<String, String> jsonHeader = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $accesstokenUser",
    };
    final res = await client.get(url, headers: jsonHeader);
    final userJson = json.decode(res.body);
    print(res.body);
    if (res.statusCode != 200) {
      throw HTTPException(res.statusCode, userJson['message']);
    }
    return true;
  }
}
