import 'package:flutter/material.dart';
import 'package:tronnshare/screens/widgets/vendorcard.dart';
import 'package:tronnshare/providers/VendorProvider.dart';
import 'package:provider/provider.dart';

class VendorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vendors = Provider.of<VendorProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF000036),
        elevation: 0.0,
        title: Text(
          'Vendors',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Color(0xFF000036),
          child: CustomScrollView(
            reverse: true,
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/images/logo.png'),
                    Expanded(
                      child: Container(
                        height: 200,
                        width: 300,
                        child: ListView.builder(
                            itemCount: vendors.productsList.length,
                            itemBuilder: (_, index) {
                              return VendorCard(
                                  firstname:
                                      vendors.productsList[index].firstname,
                                  lastname:
                                      vendors.productsList[index].lastname,
                                  mobile: vendors.productsList[index].mobile);
                            }),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
