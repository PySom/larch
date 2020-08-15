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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          name != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
              ? DetailItem(
                  title: 'Address:',
                  item: address,
                )
              : SizedBox(),
          telephone != null
              ? DetailItem(
                  title: 'Tel:',
                  item: telephone,
                )
              : SizedBox(),
          email != null
              ? DetailItem(
                  title: 'Email:',
                  item: email,
                )
              : SizedBox(),
          confession != null
              ? DetailItemWithWebView(
                  title: 'Confession:',
                  data: confession,
                )
              : SizedBox(),
          mass != null
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
          style: kLabelBodyStyle,
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
          style: kLabelBodyStyle,
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
