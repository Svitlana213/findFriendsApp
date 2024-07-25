import 'package:flutter/material.dart';

import '../values/colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  AppBarWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back, color: white),
      ),
      title: Text(title),
      titleTextStyle: TextStyle(
          color: white, fontSize: 24, fontWeight: FontWeight.w600
      ),
      centerTitle: true,
      backgroundColor: bg,
      toolbarHeight: 80,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
