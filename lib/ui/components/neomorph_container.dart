import 'package:flutter/material.dart';

class NeomorphContainer extends StatelessWidget {
  const NeomorphContainer({required this.child, this.padding = 8.0});

  final Widget child;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(top: padding),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: child,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
                color: Color(0xFFbfbfbf),
                offset: Offset(5.0, 5.0),
                blurRadius: 15.0,
                spreadRadius: 1.0),
            BoxShadow(
                color: Colors.white,
                offset: Offset(-5.0, -5.0),
                blurRadius: 15.0,
                spreadRadius: 1.0),
          ]),
    );
  }
}
