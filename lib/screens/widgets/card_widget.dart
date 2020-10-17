import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tronnshare/screens/widgets/withdraw_local_page_screen.dart';
import 'package:tronnshare/screens/widgets/withdraw_tron_page_screen.dart';

class CardWidget extends StatelessWidget {
  final int index;
  CardWidget({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (index == 0)
      return FlatButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return WithdrawLocalPageScreen();
          }));
        },
        child: Container(
          padding: EdgeInsets.only(
            left: 5,
            right: 15,
          ),
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width - 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF2ECC71),
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.centerRight,
                )),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 15,
                        top: 25,
                        bottom: 10,
                        right: 20,
                      ),
                      child: InkWell(
                        onTap: () => null,
                        child: Text(
                          'Via Bank Transfer',
                          style: GoogleFonts.spartan(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
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
    if (index == 1)
      return FlatButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return WithdrawTronPageScreen();
          }));
        },
        child: Container(
          padding: EdgeInsets.only(
            left: 5,
            right: 15,
          ),
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width - 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF2ECC71),
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.centerRight,
                )),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 15,
                        top: 25,
                        bottom: 10,
                        right: 20,
                      ),
                      child: InkWell(
                        onTap: () => null,
                        child: Text(
                          'Via Tron Transfer',
                          style: GoogleFonts.spartan(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
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
