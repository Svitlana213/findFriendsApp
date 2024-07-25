import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaquizz/values/colors.dart';
import 'package:kaquizz/widgets/notificationsWidget.dart';
import 'package:kaquizz/widgets/userCardWidget.dart';
import '../widgets/appBarWidget.dart';

class MyProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBarWidget(title: 'Kaquiz'),
      backgroundColor: bg,
      body:
      Column(
        children: [
          //top bar
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My name',
                  style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Icon(Icons.search, color: white),
                SizedBox(width: 16),
                IconButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NotificationsWidget())
                      );
                    },
                    icon: Icon(Icons.notifications, color: white,)
                )
              ],
            ),
          ),

          // list of friends
          Container(
            child: Text('Your friends', style: TextStyle(color: white, fontSize: 20)),
          ),
          SizedBox(height: 20),
          UserCardWidget(),
        ],
      ),
    );
  }
}