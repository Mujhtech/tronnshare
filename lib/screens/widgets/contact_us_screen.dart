import 'package:flutter/material.dart';

class ContactUsPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000036),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Get In Touch",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.email,
                color: Color(0xFF000036),
              ),
              title: Text(
                'contact@tronnshare.com',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xFF000036),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.phone,
                color: Color(0xFF000036),
              ),
              title: Text(
                '+2347063148208',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xFF000036),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
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
