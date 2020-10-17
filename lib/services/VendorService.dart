import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tronnshare/models/GeneralSettingModel.dart';
import 'package:tronnshare/models/VendorModel.dart';
import 'package:tronnshare/services/HttpException.dart';

class VendorService {
  static const baseUrl = 'https://tronnshare.com/api';
  final client = http.Client();

  Future<List<VendorModel>> vendorList() async {
    List<VendorModel> vendorsList = [];
    final url = '$baseUrl/vendors';
    final res = await client.get(url, headers: {
      "Accept": "application/json",
      "Content-Type": "application/json"
    });
    final userJson = json.decode(res.body);
    if (res.statusCode != 200) {
      throw HTTPException(res.statusCode, userJson['message']);
    }
    for (final item in userJson['vendor']) {
      vendorsList.add(VendorModel(
          firstname: item['firstname'],
          lastname: item['lastname'],
          mobile: int.parse(item['mobile'])));
    }
    return vendorsList;
  }

  Future<GeneralSettingModel> generalSetting() async {
    final url = '$baseUrl/general-settings';
    final res = await client.get(url, headers: {
      "Accept": "application/json",
      "Content-Type": "application/json"
    });
    final userJson = json.decode(res.body);
    if (res.statusCode != 200) {
      throw HTTPException(res.statusCode, userJson['message']);
    }
    return GeneralSettingModel.fromJson(userJson);
  }
}
