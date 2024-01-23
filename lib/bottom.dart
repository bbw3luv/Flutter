import 'package:flutter/material.dart';


class Bottom extends StatelessWidget {
  Bottom({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(label,
        style:TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),),
    );
  }
}