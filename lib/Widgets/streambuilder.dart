import 'package:flutter/material.dart';

import '../Screens/chatScreen.dart';
import 'msgline.dart';

class Msgstreambuilder extends StatelessWidget {
  const Msgstreambuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: firestore.collection('messages').orderBy('time').snapshots(),
        builder: (context, snapshot) {
          List<Msgline> messageWidgets = [];
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.yellow,
              ),
            );
          }
          final messages = snapshot.data!.docs.reversed;
          for (var message in messages) {
            final messagetext = message.get('text');
            final messagesender = message.get('sender');
            final currentuser = signedinuser.email;
            if (currentuser == messagesender) {}

            final messageWidget = Msgline(
              sender: messagesender,
              text: messagetext,
              isme: currentuser == messagesender,
            );
            messageWidgets.add(messageWidget);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              children: messageWidgets,
            ),
          );
        });
  }
}
