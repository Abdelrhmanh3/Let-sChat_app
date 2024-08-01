import 'package:flutter/material.dart';
import 'package:msgme/Screens/SignIn_screen.dart';
import 'package:msgme/Screens/regestraion_screen.dart';
import 'package:msgme/Widgets/mybutton.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static const screenRoute = 'welcomeScreen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                Text(
                  "Let's Chat",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.black54),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Mybutton(
                      title: 'Sign in',
                      color: Colors.orange,
                      onpressed: () {
                        Navigator.pushNamed(context, SigninScreen.screenRoute);
                      },
                    )),
                Mybutton(
                    title: 'Register Now',
                    color: Colors.blue,
                    onpressed: () {
                      Navigator.pushNamed(
                          context, RegestraionScreen.screenRoute);
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
