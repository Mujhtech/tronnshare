import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TransactionListWidget extends StatelessWidget {
  final String titleTxt;
  final double amount;
  final int withdrawatype;
  final int status;
  final int method;
  TransactionListWidget({
    Key key,
    @required this.titleTxt,
    @required this.amount,
    @required this.status,
    @required this.withdrawatype,
    @required this.method,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numberFormat = new NumberFormat("##,###", "en_US");
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          titleTxt,
                          style: GoogleFonts.spartan(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF000036),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        withdrawatype == 1
                            ? Text(
                                "Wallet Balance",
                                style: GoogleFonts.spartan(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF000036),
                                ),
                              )
                            : Text(
                                'Spill Over Balance',
                                style: GoogleFonts.spartan(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF000036),
                                ),
                              ),
                        status == 2
                            ? Text(
                                "Pending",
                                style: GoogleFonts.spartan(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green,
                                ),
                              )
                            : Text(
                                'Success',
                                style: GoogleFonts.spartan(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                ),
                              ),
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
                  'TRX' + "${numberFormat.format(amount)}",
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
  }
}
