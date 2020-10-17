import 'package:tronnshare/providers/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpgradePlanPagecreen extends StatefulWidget {
  const UpgradePlanPagecreen({Key key}) : super(key: key);

  @override
  _UpgradePlanPagecreenState createState() => _UpgradePlanPagecreenState();
}

class _UpgradePlanPagecreenState extends State<UpgradePlanPagecreen> {
  final _signinformkey = GlobalKey<FormState>();
  final _wkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _wkey,
      backgroundColor: Color(0xFF000036),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF000036),
        title: Text('Upgrade Plan'),
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
                          bottom: 10,
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
                                  TextFormField(
                                    controller: currentUser.newcoupon,
                                    validator: (coupon) {
                                      if (coupon.isEmpty)
                                        return 'Coupon Field is required';
                                      else
                                        return null;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.person),
                                      labelText: 'Coupon Code',
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF000036))),
                                    ),
                                    autocorrect: false,
                                    autofocus: false,
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  currentUser.loadingStatus ==
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
                                            if (!await currentUser
                                                .userChangePlan()) {
                                              _wkey.currentState
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                    currentUser.resMessage),
                                              ));
                                              return;
                                            }
                                            currentUser.clearController();
                                            _wkey.currentState
                                                .showSnackBar(SnackBar(
                                              content:
                                                  Text(currentUser.resMessage),
                                            ));
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
                                              'Upgrade Plan',
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
