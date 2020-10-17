import 'package:tronnshare/providers/UserProvider.dart';
import 'package:tronnshare/screens/widgets/card_widget.dart';
import 'package:tronnshare/screens/widgets/transaction_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 35,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 35,
                ),
                Text(
                  'Withdrawal Method',
                  style: GoogleFonts.spartan(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'There are 2 ways to withdraw',
                  style: GoogleFonts.spartan(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 3,
              right: 15,
              top: 30,
            ),
            child: Container(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: false,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return CardWidget(
                    index: index,
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recent Withdrawal",
                  style: GoogleFonts.spartan(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: List.generate(
                    currentUser.withdrawalList.length,
                    (index) {
                      return TransactionListWidget(
                        titleTxt: currentUser.withdrawalList[index].tx,
                        amount: currentUser.withdrawalList[index].amount,
                        status: currentUser.withdrawalList[index].status,
                        withdrawatype: currentUser.withdrawalList[index].type,
                        method: currentUser.withdrawalList[index].method,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
