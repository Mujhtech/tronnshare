import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tronnshare/providers/GeneralSettingProivder.dart';
import 'package:tronnshare/screens/signinscreen.dart';
import 'package:tronnshare/screens/signupscreen.dart';
import 'package:tronnshare/utils/showup.dart';
import 'package:tronnshare/providers/VendorProvider.dart';
import 'package:tronnshare/providers/UserProvider.dart';
import 'package:tronnshare/providers/WithdrawalProivder.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider()),
        ChangeNotifierProvider.value(value: WithdrawalProvider()),
        ChangeNotifierProvider.value(value: VendorProvider()),
        ChangeNotifierProvider.value(value: GeneralSettingProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tronnshare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000036),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Image.asset('assets/images/logo.png'),
              SizedBox(
                height: 30,
              ),
              ShowUp(
                child: Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'RUbik',
                    color: Colors.white.withOpacity(0.56),
                  ),
                ),
                delay: 800,
              ),
              ShowUp(
                child: Text(
                  'Tronnshare',
                  style: TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'PlayfairDisplay'),
                ),
                delay: 1000,
              ),
              SizedBox(
                height: 100,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return SignInScreen();
                  }));
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(
                    color: Colors.white,
                  ),
                ),
                child: Container(
                  width: 160,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Color(0xFF000036),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return SignUpScreen();
                      }));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
