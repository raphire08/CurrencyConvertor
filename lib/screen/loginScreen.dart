import 'package:flutter/material.dart';
import 'package:sivisoft/common.dart';
import 'package:sivisoft/api/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sivisoft/widget/topWidget.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
          children: [
            TopWidget(),
            Expanded(
              child: Center(
                child: InkWell(
                  onTap: () async {
                    UserCredential userCredential =
                        await Auth().signInWithGoogle();
                    if (userCredential != null) {
                      print(userCredential);
                      Navigator.pushNamed(context, 'baseCurrencyScreen');
                    }
                  },
                  child: Container(
                      height: 40.0,
                      width: screenWidth * 0.6,
                      color: Colors.white,
                      child: Row(
                        children: [
                          SizedBox(width: 10.0),
                          Image.asset(
                            googleIcon,
                            height: 25.0,
                          ),
                          SizedBox(width: 20.0),
                          Text('Sign in')
                        ],
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
