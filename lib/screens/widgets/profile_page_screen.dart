import 'package:flutter/material.dart';
import 'package:tronnshare/providers/UserProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:tronnshare/screens/widgets/change_password_page_screen.dart';
import 'package:tronnshare/screens/widgets/contact_us_screen.dart';
import 'package:tronnshare/screens/widgets/coupon_page_screen.dart';
import 'package:tronnshare/screens/widgets/referral_page_screen.dart';
import 'package:tronnshare/screens/widgets/upgrade_plan_page_screen.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({Key key}) : super(key: key);
  @override
  _ProfilePageScreenState createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context);
    final imageUrl = "https://tronnshare.com/assets/user/images/profile/" +
        currentUser.userModel.image;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            CircleAvatar(
              backgroundImage: (currentUser.userModel.image != null)
                  ? NetworkImage(imageUrl)
                  : AssetImage('assets/images/logo.png'),
              radius: 50.0,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              currentUser.userModel.firstname +
                  " " +
                  currentUser.userModel.lastname,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.white,
              ),
              child: Text(
                '@' + currentUser.userModel.username,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF000036),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () async {
                if (!await currentUser.userLogout()) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Something went wrong"),
                  ));
                }
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("You Logged Out"),
                ));
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(height: 35),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15, left: 8, right: 8, bottom: 8),
              child: Text(
                "Settings",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return UpgradePlanPagecreen();
                      }));
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Upgrade Plan",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF000036),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Color(0xFF000036),
                    height: 3,
                  ),
                  currentUser.userModel.isvendor == 1
                      ? InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CouponPagecreen();
                            }));
                          },
                          child: Container(
                            height: 50,
                            color: Colors.white,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Coupon Code",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF000036),
                                    )),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  currentUser.userModel.isvendor == 1
                      ? Divider(
                          color: Color(0xFF000036),
                          height: 3,
                        )
                      : Container(),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ChangePasswordPagecreen();
                        }));
                      },
                      child: Container(
                        height: 50,
                        color: Colors.white,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Change Password",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF000036),
                                )),
                          ],
                        ),
                      )),
                  Divider(
                    color: Color(0xFF000036),
                    height: 3,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ReferralPagecreen();
                        }));
                      },
                      child: Container(
                        height: 50,
                        color: Colors.white,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("My Referral",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF000036),
                                )),
                          ],
                        ),
                      )),
                  Divider(
                    color: Color(0xFF000036),
                    height: 3,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ContactUsPageScreen();
                        }));
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Contact Us",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF000036),
                                )),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
