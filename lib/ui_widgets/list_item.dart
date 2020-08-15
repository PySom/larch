import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/helpers/background_image_container.dart';
import 'package:lagosarchdiocese/helpers/padded_widget.dart';
import 'package:lagosarchdiocese/utils/constants.dart';

import 'circle_image.dart';

class ListItemSide extends StatelessWidget {
  final String title;
  final String brief;
  final String date;
  const ListItemSide({this.title, this.brief, this.date});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: kListTextStyle,
        ),
        Text(
          brief,
          style: kListTextStyle,
        ),
        Text(
          date,
          style: kListTextStyle,
        ),
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  final String image;
  final Widget child;
  final Function onTap;
  final Color color;
  const ListItem(
      {this.image, this.child, this.onTap, this.color = kListTileColor});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          color: color,
          child: Padded(
            child: Row(
              children: <Widget>[
                CircleImage(
                  radius: 30,
                  url: image,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Container(
                    child: child,
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class ListSubItem extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String content;
  final Color color;
  const ListSubItem(
      {this.image,
      this.title,
      this.content,
      this.subtitle,
      this.color = kListTileColor});

  @override
  Widget build(BuildContext context) {
    return Padded(
      child: Container(
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (image != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BackgroundImageContainer(
                    height: 140.0,
                    image: CachedNetworkImageProvider(image),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style:
                        kLabelHeaderStyle.copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    subtitle,
                    style: kListTextStyle,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    content,
                    style: kListTextStyle.copyWith(color: kTextColor),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
