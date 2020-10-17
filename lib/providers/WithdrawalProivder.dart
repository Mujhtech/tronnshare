import 'package:flutter/material.dart';
import 'package:tronnshare/models/WithdrawalModel.dart';
import 'package:tronnshare/services/UserService.dart';

enum Status { Loading, Finish, Start }

class WithdrawalProvider with ChangeNotifier {
  List<WithdrawalModel> withdrawalList = [];
  Status status = Status.Start;
  String resMessage;
  UserService _userService = UserService();
}
