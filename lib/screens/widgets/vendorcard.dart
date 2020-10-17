import 'package:flutter/material.dart';

class VendorCard extends StatelessWidget {
  final String firstname;
  final String lastname;
  final int mobile;

  const VendorCard(
      {Key key, @required this.firstname, @required this.lastname, this.mobile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.green, offset: Offset(2, 1), blurRadius: 5)
            ]),
        child: ListTile(
          onTap: () {
//            Navigator.pop(context);
          },
          leading: Icon(Icons.person),
          title: Text(firstname + " " + lastname),
          subtitle: Text('0' + '$mobile'),
        ),
      ),
    );
  }
}
