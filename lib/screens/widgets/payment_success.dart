import 'package:flutter/material.dart';

class PaymentSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000036),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.check_circle,
            color: Colors.white,
            size: 64,
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Withdrawal Successful",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: BorderSide(
                      color: Color(0xFF000036),
                    ),
                  ),
                  icon: Icon(
                    Icons.home,
                    color: Color(0xFF000036),
                  ),
                  label: Text("Go back home")),
            ],
          )
        ],
      ),
    );
  }
}
