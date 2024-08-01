import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  const Mybutton(
      {required this.title, required this.color, required this.onpressed});
  final String title;
  final Color color;
  final Function() onpressed;
  @override
  Widget build(BuildContext context) {
    return Material(
      // elevation: 9,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        onPressed: onpressed,
        color: color,
        minWidth: 200,
        height: 45,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
