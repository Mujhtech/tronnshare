import 'package:flutter/material.dart';
import 'package:tronnshare/screens/widgets/signinform.dart';

class SignInScreen extends StatelessWidget {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF000036),
        elevation: 0.0,
        title: Text(
          'Welcome Back!',
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
                      child: SignInForm(signscreenkey: _key),
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
