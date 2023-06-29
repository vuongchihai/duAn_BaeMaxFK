import 'package:flutter/material.dart';

class dsChonTimKiem extends StatelessWidget {
  final String child;

  dsChonTimKiem({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        height: 200,
        color: Colors.red,
        child: Text(child,
        style: TextStyle(
          fontSize: 40,
          color: Colors.black,
        ),),
      ),
    );
  }
}
