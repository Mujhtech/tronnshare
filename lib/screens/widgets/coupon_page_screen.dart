import 'package:tronnshare/providers/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CouponPagecreen extends StatelessWidget {
  const CouponPagecreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xFF000036),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF000036),
        title: Text('My Coupons'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              child: currentUser.couponList.length > 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                            children: List.generate(
                          currentUser.couponList.length,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                                                      .couponList[index].code,
                                                  style: GoogleFonts.spartan(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xFF000036),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                currentUser.couponList[index]
                                                            .status ==
                                                        1
                                                    ? Text(
                                                        "Used",
                                                        style:
                                                            GoogleFonts.spartan(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Color(0xFF000036),
                                                        ),
                                                      )
                                                    : Text(
                                                        "Not Used",
                                                        style:
                                                            GoogleFonts.spartan(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Color(0xFF000036),
                                                        ),
                                                      )
                                              ],
                                            ),
                                          ],
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
                        )),
                      ],
                    )
                  : Center(
                      child: Text(
                        "No coupon found",
                        style: TextStyle(color: Colors.white, fontSize: 14.0),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
