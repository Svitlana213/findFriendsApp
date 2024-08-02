import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kaquizz/screens/welcomeScreen.dart';

Future<void> logout(BuildContext context) async {
  // Sign out from Firebase
  await FirebaseAuth.instance.signOut();
  await GoogleSignIn().signOut();

  // Clear the user's session or authentication token
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();

  // Navigate the user to the welcome screen
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => WelcomeScreen()),
  );
}
