import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaquizz/widgets/primaryButtonWidget.dart';
import '../values/colors.dart';
import 'myProfile.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'Welcome to Kaquiz!',
                      style: TextStyle(color: white, fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Find friends in our app',
                      style: TextStyle(color: white, fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PrimaryButtonWidget(
                          text: 'Sign up',
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MyProfile()));
                          }
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}