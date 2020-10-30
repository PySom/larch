import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/utils/constants.dart';
import 'load_web_view.dart';

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

  bool isNotNullOrEmpty(String item) => item != null && item.trim() != '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          isNotNullOrEmpty(name)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      name,
                      style: kLabelHeaderStyle,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                  ],
                )
              : SizedBox(),
          isNotNullOrEmpty(address)
              ? DetailItem(
                  title: 'Address:',
                  item: address,
                )
              : SizedBox(),
          isNotNullOrEmpty(telephone)
              ? DetailItem(
                  title: 'Tel:',
                  item: telephone,
                )
              : SizedBox(),
          isNotNullOrEmpty(email)
              ? DetailItem(
                  title: 'Email:',
                  item: email,
                )
              : SizedBox(),
          isNotNullOrEmpty(confession)
              ? DetailItemWithWebView(
                  title: 'Confession:',
                  data: confession,
                )
              : SizedBox(),
          isNotNullOrEmpty(mass)
              ? DetailItemWithWebView(
                  title: 'Mass:',
                  data: mass,
                )
              : SizedBox(),
        ],
      )),
    );
  }
}

class DetailItemWithWebView extends StatelessWidget {
  final String title;
  final String data;
  const DetailItemWithWebView({this.data, this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Text(
          title,
          style: kLabelBodyStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 5.0,
        ),
        LoadWebView(
          data: data,
        ),
      ],
    );
  }
}

class DetailItem extends StatelessWidget {
  final String title;
  final String item;
  const DetailItem({this.title, this.item});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text(
          title,
          style: kLabelBodyStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 5.0,
        ),
        Expanded(
          child: Text(
            item,
            style: kLabelBodyLittleStyle,
          ),
        ),
      ],
    );
  }
}
