import 'package:tronnshare/providers/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePasswordPagecreen extends StatefulWidget {
  const ChangePasswordPagecreen({Key key}) : super(key: key);

  @override
  _ChangePasswordPagecreenState createState() =>
      _ChangePasswordPagecreenState();
}

class _ChangePasswordPagecreenState extends State<ChangePasswordPagecreen> {
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
        title: Text('Change My Password'),
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
                                  TextFormField(
                                    controller: currentUser.newpassword,
                                    validator: (password) {
                                      if (password.isEmpty)
                                        return 'Password Field is required';
                                      else
                                        return null;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.lock),
                                      labelText: 'Password',
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF000036))),
                                    ),
                                    autocorrect: false,
                                    autofocus: false,
                                    obscureText: true,
                                  ),
                                  SizedBox(
                                    height: 8,
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
                                                .userChangePassword()) {
                                              _wkey.currentState
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Something went wrong"),
                                              ));
                                              return;
                                            }
                                            currentUser.clearController();
                                            _wkey.currentState
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                  "Password Change successfully"),
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
                                              'Change Password',
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
