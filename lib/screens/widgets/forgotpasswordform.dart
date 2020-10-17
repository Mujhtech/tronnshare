import 'package:flutter/material.dart';
import 'package:tronnshare/screens/homescreen.dart';
import 'package:tronnshare/screens/signinscreen.dart';

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _forgotpasswordformkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
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
        key: _forgotpasswordformkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                TextFormField(
                  validator: (email) {
                    if (email.isEmpty)
                      return 'Email Field is required';
                    else
                      return null;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email address',
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Color(0xFF000036))),
                  ),
                  autocorrect: false,
                  autofocus: false,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    if (!_forgotpasswordformkey.currentState.validate()) {
                      return;
                    }
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Something went wrong"),
                    ));
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
                      'Recover Account',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Have an account? ',
                      style: TextStyle(
                        color: Color(0xFF000036),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignInScreen();
                        }));
                      },
                      child: Text(
                        'Login here',
                        style: TextStyle(
                          color: Color(0xFF000036),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
