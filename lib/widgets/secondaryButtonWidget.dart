import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../values/colors.dart';

class SecondaryButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  SecondaryButtonWidget({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        // padding: EdgeInsets.zero,
        backgroundColor: transparent,
      ),
      child: Text(
        text,
        style: TextStyle(
          color:white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          decoration: TextDecoration.underline,
          decorationColor: white,
        ),
      ),
    );
  }
}
