import 'package:flutter/material.dart';
import 'package:msgme/Screens/SignIn_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:msgme/Screens/chatScreen.dart';
import '../Widgets/mybutton.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegestraionScreen extends StatefulWidget {
  const RegestraionScreen({super.key});
  static const screenRoute = 'regestrationScreen';
  @override
  State<RegestraionScreen> createState() => _RegestraionScreenState();
}

class _RegestraionScreenState extends State<RegestraionScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool spinner = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: spinner,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  // SizedBox(
                  //   height: 50,
                  // ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(120, 120, 120, 0),
                    child: Container(
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Please Enter Your Email and Passwords',
                    style: TextStyle(color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.start,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Your Email',
                      contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.orange, width: 2),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 3),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    obscureText: true,
                    textAlign: TextAlign.start,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Your Password',
                      contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.orange, width: 2),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 3),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Mybutton(
                    title: 'Register',
                    color: Colors.blue,
                    onpressed: () async {
                      setState(() {
                        spinner = true;
                      });
                      try {
                        final newuser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        Navigator.pushNamed(context, Chatscreen.screenRoute);
                        setState(() {
                          spinner = false;
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("You already have account "),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SigninScreen.screenRoute);
                      },
                      child: Container(child: Text("Login")))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
