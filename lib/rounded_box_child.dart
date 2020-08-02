import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundedBoxChild extends StatelessWidget {
  final String image;
  final String title;
  RoundedBoxChild({@required this.image, @required this.title, Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(image),
        SizedBox(
          height: kSizedBoxHeight,
        ),
        Text(
          title,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
