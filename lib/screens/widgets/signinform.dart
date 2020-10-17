import 'package:flutter/material.dart';
import 'package:tronnshare/screens/forgotpasswordscreen.dart';
import 'package:tronnshare/screens/homescreen.dart';
import 'package:tronnshare/screens/signupscreen.dart';
import 'package:tronnshare/providers/UserProvider.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatefulWidget {
  final Key signscreenkey;

  SignInForm({Key key, @required this.signscreenkey}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _signinformkey = GlobalKey<FormState>();
  final signscreenkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
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
        key: _signinformkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                TextFormField(
                  controller: user.username,
                  validator: (username) {
                    if (username.isEmpty)
                      return 'Username Field is required';
                    else
                      return null;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Username',
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Color(0xFF000036))),
                  ),
                  autocorrect: false,
                  autofocus: false,
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: user.password,
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
                        borderSide: BorderSide(color: Color(0xFF000036))),
                  ),
                  autocorrect: false,
                  autofocus: false,
                  obscureText: true,
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ForgotPasswordScreen();
                        }));
                      },
                      child: Text(
                        'Forget your password?',
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
            Column(
              children: <Widget>[
                user.status == Status.Authenticating
                    ? Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xFF000036)),
                        ),
                      )
                    : FlatButton(
                        onPressed: () async {
                          if (!_signinformkey.currentState.validate()) {
                            return;
                          }
                          if (!await user.userLogIn()) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("Invalid Login details"),
                            ));
                            return;
                          }
                          user.clearController();
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return HomeScreen();
                          }));
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
                            'Login',
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
                      'Don\'t have an account? ',
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
                          return SignUpScreen();
                        }));
                      },
                      child: Text(
                        'Sign Up?',
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
