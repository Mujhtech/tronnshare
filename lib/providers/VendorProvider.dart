import 'package:flutter/material.dart';
import 'package:tronnshare/models/VendorModel.dart';
import 'package:tronnshare/services/VendorService.dart';

class VendorProvider with ChangeNotifier {
  List<VendorModel> productsList = [];
  VendorService _vendorsServices = VendorService();

  VendorProvider() {
    loadProducts();
  }

  Future loadProducts() async {
    productsList = await _vendorsServices.vendorList();
    notifyListeners();
  }
}
