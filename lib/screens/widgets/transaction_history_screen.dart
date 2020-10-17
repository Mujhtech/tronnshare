import 'package:tronnshare/providers/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({Key key}) : super(key: key);

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
                  'Transaction History',
                  style: GoogleFonts.spartan(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                )
              ],
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
                Column(
                  children: List.generate(
                    currentUser.transactionList.length,
                    (index) {
                      return Column(
                        children: [
                          Container(
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            currentUser
                                                .transactionList[index].tx,
                                            style: GoogleFonts.spartan(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xFF000036),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            currentUser
                                                .transactionList[index].details,
                                            style: GoogleFonts.spartan(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF000036),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Text(
                                    'TRX' +
                                        "${currentUser.transactionList[index].amount}",
                                    style: GoogleFonts.openSans(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF000036),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
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
