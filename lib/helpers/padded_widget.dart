import 'package:flutter/material.dart';

class Padded extends StatelessWidget {
  final Widget child;
  const Padded({this.child});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: child,
    );
  }
}
