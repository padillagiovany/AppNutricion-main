import 'package:flutter/material.dart';

class Modal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop('Awesome data');
        },
        child: Center(
          child: Text('Hello modal!'),
        ),
      ),
    );
  }
}