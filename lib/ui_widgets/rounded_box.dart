import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/utils/constants.dart';

class RoundedBox extends StatelessWidget {
  final Color colour;
  final Function onTap;
  final Widget boxChild;
  RoundedBox({@required this.colour, this.boxChild, this.onTap, Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 72.0,
        height: 65.0,
        padding: const EdgeInsets.all(5.0),
        child: boxChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: this.colour ?? kRoundedIconColor,
        ),
      ),
    );
  }
}
