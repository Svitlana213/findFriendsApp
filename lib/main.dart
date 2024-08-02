import 'package:flutter/material.dart';
import 'package:kaquizz/screens/welcomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(
    apiKey: 'AIzaSyA_4Oa7xnE4RzBeY3D4ltQ9mF0VoaJSSks',
    appId: '1:416312225166:android:e0f798cd69171365fa88df',
    messagingSenderId: '416312225166',
    projectId: 'findfriends-4ca64',
    storageBucket: 'findfriends-4ca64.appspot.com',
  )
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: WelcomeScreen(),
    );
  }
}
