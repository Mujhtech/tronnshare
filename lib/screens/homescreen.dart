import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tronnshare/screens/widgets/currentscreenindex.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedOptionIndex = 0;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Color(0xFF000036),
        bottomNavigationBar: _buildBottomNavigationBarPortrait(),
        body: CurrentScreenIndex(selectedOptionIndex),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedOptionIndex = index;
    });
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
              title: Text('Are you sure'),
              content: Text('Do you want to exit an App'),
              actions: [
                new GestureDetector(
                  onTap: () => Navigator.of(context).pop(false),
                  child: Text(
                    'No',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(width: 16),
                new GestureDetector(
                  onTap: () => SystemChannels.platform
                      .invokeMethod('SystemNavigator.pop'),
                  child: Text(
                    'Yes',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ));
  }

  Widget _buildBottomNavigationBarPortrait() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Dashboard'),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.creditCard),
          title: Text('Transactions'),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.commentDots),
          title: Text('Withdrawal'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          title: Text('Profile'),
        ),
      ],
      currentIndex: selectedOptionIndex,
      onTap: _onItemTapped,
      backgroundColor: Color(0xFF000036),
      selectedItemColor: Color(0xFF2ECC71),
      unselectedItemColor: Colors.white,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    );
  }
}
