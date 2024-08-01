import 'package:flutter/material.dart';
import 'package:msgme/Screens/SignIn_screen.dart';
import 'package:msgme/Screens/chatScreen.dart';
import 'package:msgme/Screens/regestraion_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          appId: '1:240125777269:android:d1b6363723486347326f3c',
          apiKey: 'AIzaSyDbrendaMV4sXajcpq4m2tfBnp1d_KiVLE',
          messagingSenderId: '240125777269',
          projectId: 'msgmee-eb7cb'));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Message Me',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: Chatscreen(),
      initialRoute: _auth.currentUser != null
          ? Chatscreen.screenRoute
          : WelcomeScreen.screenRoute,
      routes: {
        WelcomeScreen.screenRoute: (context) => WelcomeScreen(),
        SigninScreen.screenRoute: (context) => SigninScreen(),
        RegestraionScreen.screenRoute: (context) => RegestraionScreen(),
        Chatscreen.screenRoute: (context) => Chatscreen()
      },
    );
  }
}
