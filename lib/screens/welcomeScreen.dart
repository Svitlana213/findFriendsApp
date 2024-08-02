import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaquizz/widgets/primaryButtonWidget.dart';
import '../values/colors.dart';
import 'myProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WelcomeScreen extends StatelessWidget {
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, get the UserCredential
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      // Get the ID token from the UserCredential


      // Return the ID token
      return userCredential;
    } catch (error) {
      print("Error signing in with Google: $error");
      return null;
    }
  }

  Future<bool> verifyToken(String? idToken) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.0.104:5236/api/Auth'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'idToken': idToken.toString(),
        }),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print("Token verification failed: ${response.body}");
        return false;
      }
    } catch (error) {
      print("Error verifying token: $error");
      return false;
    }
  }

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
                          text: 'Continue with Google',
                          onPressed: () async {
                            var userCredential = await signInWithGoogle();
                            if (userCredential != null) {
                              String? idToken = await userCredential.user?.getIdToken();
                              var isTokenValid = await verifyToken(idToken);
                              if (isTokenValid) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MyProfile(user: userCredential.user)),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Token verification failed.')),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Google sign-in failed.')),
                              );
                            }
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
