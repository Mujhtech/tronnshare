import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tronnshare/providers/GeneralSettingProivder.dart';
import 'package:tronnshare/providers/UserProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:esys_flutter_share/esys_flutter_share.dart';

class HomePageScreen extends StatefulWidget {
  HomePageScreen({Key key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final numberFormat = new NumberFormat("##,###.00#", "en_US");
  Color color = Colors.white;
  Color fcolor = Colors.white;
  bool isActive = false;
  int activeIndex;

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context);
    final currentSetting = Provider.of<GeneralSettingProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xFF000036),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello,",
                    style: GoogleFonts.spartan(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    currentUser.userModel.firstname +
                        " " +
                        currentUser.userModel.lastname,
                    //'TRX' + "${numberFormat.format(278.05)}",
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Overview',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Text('Wallet Balance'),
                        Text(
                          'TRX' + "${currentUser.currentBalance}",
                          style: GoogleFonts.spartan(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 155,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Text('Spill Over Balance'),
                        Text(
                          'TRX' + "${currentUser.currentSpillOver}",
                          style: GoogleFonts.spartan(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Text('Wallet Balance'),
                        Text(
                          'USD' +
                              "${(currentUser.currentBalance * currentSetting.generalSettingModel.usdrate).ceil()}",
                          style: GoogleFonts.spartan(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 155,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Text('Spill Over Balance'),
                        Text(
                          'USD' +
                              "${(currentUser.currentSpillOver * currentSetting.generalSettingModel.usdrate).ceil()}",
                          style: GoogleFonts.spartan(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Text('Wallet Balance'),
                        Text(
                          'NGN' +
                              "${(currentUser.currentBalance * currentSetting.generalSettingModel.nairarate).ceil()}",
                          style: GoogleFonts.spartan(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 155,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Text('Spill Over Balance'),
                        Text(
                          'NGN' +
                              "${(currentUser.currentSpillOver * currentSetting.generalSettingModel.nairarate).ceil()}",
                          style: GoogleFonts.spartan(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Today Spill Over',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 250,
                width: 315,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Share this on your whatsapp",
                    style: GoogleFonts.spartan(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Image(
                    image: currentUser.spillOverModel.image != null
                        ? NetworkImage(currentUser.spillOverModel.image)
                        : AssetImage('assets/images/logo.png'),
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  currentUser.userClick
                      ? currentUser.loadingStatus == StatusLoading.Loading
                          ? Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFF000036)),
                              ),
                            )
                          : FlatButton(
                              onPressed: () async {
                                if (!await currentUser.userGetSpillOver(
                                    currentUser.spillOverModel.id)) {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(currentUser.resMessage),
                                  ));
                                } else {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        'You have successfully earn today spill over'),
                                  ));
                                }
                                currentUser.userClickShare(false);
                              },
                              color: Color(0xFF000036),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                                side: BorderSide(
                                  color: Color(0xFF000036),
                                ),
                              ),
                              child: Container(
                                width: 160,
                                height: 40,
                                alignment: Alignment.center,
                                child: Text(
                                  'Earn Reward Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                      : FlatButton(
                          onPressed: () async {
                            try {
                              var request = await HttpClient().getUrl(
                                  Uri.parse(currentUser.spillOverModel.image));
                              var response = await request.close();
                              Uint8List bytes =
                                  await consolidateHttpClientResponseBytes(
                                      response);
                              await Share.file(
                                  currentUser.spillOverModel.content,
                                  'tronnshare.jpg',
                                  bytes,
                                  'image/jpg',
                                  text: currentUser.spillOverModel.title +
                                      ' https://tronnshare.com');
                              currentUser.userClickShare(true);
                            } catch (e) {
                              print(e);
                            }
                          },
                          child: Icon(Icons.share))
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
