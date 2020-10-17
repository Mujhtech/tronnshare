import 'package:flutter/material.dart';
import 'package:tronnshare/models/GeneralSettingModel.dart';
import 'package:tronnshare/services/VendorService.dart';

class GeneralSettingProvider extends ChangeNotifier {
  GeneralSettingModel generalSettingModel;

  VendorService _vendorsServices = VendorService();
  GeneralSettingProvider() {
    loadSettings();
  }

  Future loadSettings() async {
    generalSettingModel = await _vendorsServices.generalSetting();
    notifyListeners();
  }
}
