import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tronnshare/providers/GeneralSettingProivder.dart';
import 'package:tronnshare/providers/UserProvider.dart';
import 'package:tronnshare/screens/widgets/payment_success.dart';

class WithdrawLocalPageScreen extends StatefulWidget {
  const WithdrawLocalPageScreen({Key key}) : super(key: key);

  @override
  _WithdrawLocalPageScreenState createState() =>
      _WithdrawLocalPageScreenState();
}

class _WithdrawLocalPageScreenState extends State<WithdrawLocalPageScreen> {
  final _signinformkey = GlobalKey<FormState>();
  final _wkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final currentSetting = Provider.of<GeneralSettingProvider>(context);
    final currentWithdraw = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _wkey,
      backgroundColor: Color(0xFF000036),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF000036),
        title: Text('Via Bank Transfer'),
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
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 5,
                          bottom: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                        ),
                        child: Form(
                          key: _signinformkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    'Rate: 1TRX = ' +
                                        'NGN${currentSetting.generalSettingModel.nairarate}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    'Limit: ' +
                                        '${currentSetting.generalSettingModel.bankmin} -' +
                                        ' ${currentSetting.generalSettingModel.bankmax}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  TextFormField(
                                    controller: currentWithdraw.amount,
                                    validator: (amount) {
                                      if (amount.isEmpty)
                                        return 'Amount Field is required';
                                      else
                                        return null;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.person),
                                      labelText: 'Amount',
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF000036))),
                                    ),
                                    autocorrect: false,
                                    autofocus: false,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  TextFormField(
                                    controller: currentWithdraw.bankname,
                                    validator: (bankname) {
                                      if (bankname.isEmpty)
                                        return 'Bank Name Field is required';
                                      else
                                        return null;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.person),
                                      labelText: 'Bank Name',
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF000036))),
                                    ),
                                    autocorrect: false,
                                    autofocus: false,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  TextFormField(
                                    controller: currentWithdraw.bankacctname,
                                    validator: (bankaactname) {
                                      if (bankaactname.isEmpty)
                                        return 'Bank Account Name Field is required';
                                      else
                                        return null;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.person),
                                      labelText: 'Bank Account Name',
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF000036))),
                                    ),
                                    autocorrect: false,
                                    autofocus: false,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  TextFormField(
                                    controller: currentWithdraw.bankacctno,
                                    validator: (bankaactno) {
                                      if (bankaactno.isEmpty)
                                        return 'Bank Account Number Field is required';
                                      else
                                        return null;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.person),
                                      labelText: 'Bank Account Number',
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF000036))),
                                    ),
                                    autocorrect: false,
                                    autofocus: false,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(20.0),
                                    child: DropdownButton(
                                        value: currentWithdraw.withdrawtype !=
                                                null
                                            ? int.parse(
                                                currentWithdraw.withdrawtype)
                                            : 0,
                                        items: [
                                          DropdownMenuItem(
                                            child: Text("Select Balance"),
                                            value: 0,
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Wallet Balance"),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Spill Over Balance"),
                                            value: 2,
                                          ),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            currentWithdraw.changeType(value);
                                          });
                                        }),
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  currentWithdraw.loadingStatus ==
                                          StatusLoading.Loading
                                      ? Center(
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Color(0xFF000036)),
                                          ),
                                        )
                                      : FlatButton(
                                          onPressed: () async {
                                            if (!_signinformkey.currentState
                                                .validate()) {
                                              return;
                                            }

                                            if (currentWithdraw.withdrawtype ==
                                                null) {
                                              _wkey.currentState
                                                  .showSnackBar(SnackBar(
                                                content:
                                                    Text("Select Balance Type"),
                                              ));
                                              return;
                                            }
                                            if (!await currentWithdraw
                                                .userWithdrawLocal()) {
                                              _wkey.currentState
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                    currentWithdraw.resMessage),
                                              ));
                                              return;
                                            }
                                            currentWithdraw
                                                .clearWithdrawController();
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return PaymentSuccess();
                                            }));
                                          },
                                          color: Color(0xFF000036),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                            side: BorderSide(
                                              color: Color(0xFF000036),
                                            ),
                                          ),
                                          child: Container(
                                            width: 160,
                                            height: 40,
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Withdraw',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
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
