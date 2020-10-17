import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tronnshare/screens/signinscreen.dart';
import 'package:tronnshare/screens/vendorscreen.dart';
import 'package:tronnshare/providers/UserProvider.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _signupformkey = GlobalKey<FormState>();
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
        key: _signupformkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                TextFormField(
                  controller: user.email,
                  validator: (email) {
                    Pattern pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex = new RegExp(pattern);
                    if (email.isEmpty)
                      return 'Email Field is required';
                    else if (!regex.hasMatch(email))
                      return 'Email address is not valid';
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
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: user.password,
                  validator: (password) {
                    Pattern pattern =
                        r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
                    RegExp reqex = new RegExp(pattern);
                    if (password.isEmpty)
                      return 'Password Field is required';
                    else if (password.length <= 6)
                      return 'Password length should be more than 6';
                    else
                      return null;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Color(0xFF000036))),
                  ),
                  autocorrect: false,
                  autofocus: false,
                  obscureText: true,
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: user.username,
                  validator: (username) {
                    if (username.isEmpty)
                      return 'Username Field is required';
                    else if (username.length <= 6)
                      return 'Username lenght should be more than 6';
                    else
                      return null;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(FontAwesomeIcons.userCircle),
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
                  controller: user.firstname,
                  validator: (firstname) {
                    if (firstname.isEmpty)
                      return 'Firstname Field is required';
                    else
                      return null;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(FontAwesomeIcons.userCircle),
                    labelText: 'Firstname',
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
                  controller: user.lastname,
                  validator: (lastname) {
                    if (lastname.isEmpty)
                      return 'Lastname Field is required';
                    else
                      return null;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(FontAwesomeIcons.userCircle),
                    labelText: 'Lastname',
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
                  controller: user.mobile,
                  validator: (mobile) {
                    if (mobile.isEmpty)
                      return 'Phone Number Field is required';
                    else
                      return null;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(FontAwesomeIcons.phoneSquare),
                    labelText: 'Phone Number',
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
                  controller: user.coupon,
                  validator: (couponcode) {
                    if (couponcode.isEmpty)
                      return 'Coupon Code Field is required';
                    else
                      return null;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.verified_user),
                    labelText: 'Coupon Code',
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Color(0xFF000036))),
                  ),
                  autocorrect: false,
                  autofocus: false,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Click here to contact our vendors ',
                      style: TextStyle(
                        color: Color(0xff485068),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return VendorScreen();
                        }));
                      },
                      child: Text(
                        'Here',
                        style: TextStyle(
                          color: Color(0xFF000036),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: user.referral,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(FontAwesomeIcons.userCircle),
                    labelText: 'Referral Code',
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
                user.status == Status.Authenticating
                    ? Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xFF000036)),
                        ),
                      )
                    : FlatButton(
                        onPressed: () async {
                          if (!_signupformkey.currentState.validate()) {
                            return;
                          }
                          if (!await user.userRegister()) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(user.errorMessage),
                            ));
                            return;
                          }
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content:
                                Text("Registration completed, Please log in"),
                          ));
                          user.clearController();
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
                            'Create Account',
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
                      'Already have an account? ',
                      style: TextStyle(
                        color: Color(0xff485068),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return SignInScreen();
                        }));
                      },
                      child: Text(
                        'Login?',
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
