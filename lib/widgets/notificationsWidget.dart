import 'package:flutter/material.dart';
import 'package:kaquizz/values/colors.dart';
import 'appBarWidget.dart';
import 'userCardWidget.dart';

class NotificationsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Kaquiz'),
      backgroundColor: bg,
      body: Column(
        children: [
          Container(
            child: Text('Your notifications', style: TextStyle(color: white, fontSize: 20)),
          ),
          SizedBox(height: 20),
          UserCardWidget(), // change
        ],
      ),
    );
  }
}