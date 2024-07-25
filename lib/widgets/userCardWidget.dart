import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaquizz/widgets/secondaryButtonWidget.dart';
import '../screens/userProfile.dart';
import '../values/colors.dart';

class UserCardWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(8)
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'User name',
            style: TextStyle(color: white, fontSize: 16),
          ),
          SecondaryButtonWidget(
              text: 'See more',
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserProfile()));
              }
          )
        ],
      ),
    );
  }
}