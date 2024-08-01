import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:msgme/Screens/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Widgets/streambuilder.dart';

final firestore = FirebaseFirestore.instance;
late User signedinuser;

class Chatscreen extends StatefulWidget {
  const Chatscreen({super.key});
  static const screenRoute = 'chatScreen';

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  final mesTextcontroller = TextEditingController();
  final _auth = FirebaseAuth.instance;

  String? messagetext;

  @override
  void initState() {
    super.initState();
    getCurrentuser();
  }

  void getCurrentuser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedinuser = user;
        print(signedinuser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void messagesStream() async {
    await for (var snapshot in firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              'images/logo.png',
              height: 25,
            ),
            SizedBox(
              width: 8,
            ),
            Text('chat')
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.popAndPushNamed(context, WelcomeScreen.screenRoute);
              },
              icon: Icon(Icons.close))
        ],
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Msgstreambuilder(),
          Container(
            decoration: BoxDecoration(
                border:
                    Border(top: BorderSide(color: Colors.yellow, width: 1))),
            child: Row(children: [
              Expanded(
                child: TextField(
                  controller: mesTextcontroller,
                  onChanged: (value) {
                    messagetext = value;
                  },
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(5, 0, 0, 3),
                      hintText: 'Write your message here.....',
                      border: InputBorder.none),
                ),
              ),
              IconButton(
                  onPressed: () {
                    mesTextcontroller.clear();
                    firestore.collection('messages').add({
                      'text': messagetext,
                      'sender': signedinuser.email,
                      'time': FieldValue.serverTimestamp()
                    });
                  },
                  icon: Icon(Icons.send))
            ]),
          )
        ],
      )),
    );
  }
}
