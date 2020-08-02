import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
import 'constants.dart';

class ParishDetail extends StatelessWidget {
  final String name;
  final String address;
  final String telephone;
  final String email;
  final String confession;
  final String mass;

  ParishDetail({
    this.name,
    this.address,
    this.telephone,
    this.email,
    this.confession,
    this.mass,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        name != null
            ? Column(
                children: <Widget>[
                  Text(
                    name,
                    style: kParishLabelStyle,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                ],
              )
            : SizedBox(),
        address != null
            ? Row(
                children: <Widget>[
                  Text(
                    "Address: ",
                    style: kLabelBodyStyle,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    address,
                    style: kLabelBodyLittleStyle,
                  ),
                ],
              )
            : SizedBox(),
        telephone != null
            ? Row(
                children: <Widget>[
                  Text(
                    "Tel: ",
                    style: kLabelBodyStyle,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    telephone,
                    style: kLabelBodyLittleStyle,
                  ),
                ],
              )
            : SizedBox(),
        email != null
            ? Row(
                children: <Widget>[
                  Text(
                    email,
                    style: kLabelBodyStyle,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    email,
                    style: kLabelBodyLittleStyle,
                  ),
                ],
              )
            : SizedBox(),
        confession == null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    "Confession:",
                    style: kLabelBodyStyle,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Html(
                    data: '<div>Hello World</div>',
                    style: {
                      "div": Style(
                        fontSize: FontSize.percent(180),
                      ),
                    },
                  ),
                ],
              )
            : SizedBox(),
      ],
    ));
  }
}
