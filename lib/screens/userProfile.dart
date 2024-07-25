import 'package:flutter/material.dart';
import '../values/colors.dart';
import '../widgets/appBarWidget.dart';
import '../widgets/primaryButtonWidget.dart';

class UserProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBarWidget(title: 'Kaquiz'),
      backgroundColor: bg,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text('User name',
                  style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w600)
                ),
                Spacer(),
                PrimaryButtonWidget(
                    text: 'Follow',
                    onPressed: (){} // call follow/unfollow user
                )
              ],
            ),
          )

          // show location or error message
        ],
      )
    );
  }
}