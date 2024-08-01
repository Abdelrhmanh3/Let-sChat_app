import 'package:flutter/material.dart';

class Inputs extends StatelessWidget {
  const Inputs({
    super.key,
    required this.title,
    required this.onChanged,
  });
  final String title;
  final Function() onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.start,
      onChanged: onChanged(),
      decoration: InputDecoration(
        hintText: title,
        contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange, width: 2),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 3),
            borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
