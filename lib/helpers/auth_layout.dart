import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lagosarchdiocese/utils/constants.dart';

import 'background_image_container.dart';

class AuthLayout extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const AuthLayout({this.title, this.children});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: BackgroundImageContainer(
              image: AssetImage('${kImageUrl}larch_user_bg.jpg'),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 47.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: double.infinity,
                        ),
                        Text(
                          title,
                          style: kLabelHeaderStyle.copyWith(
                              color: Colors.white, fontSize: 16.0),
                        ),
                        SizedBox(
                          height: 120,
                        ),
                        ...children,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
