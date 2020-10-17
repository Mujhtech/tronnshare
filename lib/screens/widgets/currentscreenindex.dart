import 'package:tronnshare/screens/widgets/card_screen.dart';
import 'package:tronnshare/screens/widgets/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:tronnshare/screens/widgets/profile_page_screen.dart';
import 'package:tronnshare/screens/widgets/transaction_history_screen.dart';

class CurrentScreenIndex extends StatelessWidget {
  final int index;

  CurrentScreenIndex(
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 1:
        {
          return TransactionHistoryScreen();
        }
        break;
      case 2:
        {
          return CardScreen();
        }
        break;
      case 3:
        {
          return ProfilePageScreen();
        }
        break;
      default:
        {
          return HomePageScreen();
        }
        break;
    }
  }
}
