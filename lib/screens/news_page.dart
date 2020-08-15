import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lagosarchdiocese/helpers/background_image_container.dart';
import 'package:lagosarchdiocese/helpers/network_image_cache.dart';
import 'package:lagosarchdiocese/ui_widgets/circle_image.dart';
import 'package:lagosarchdiocese/ui_widgets/list_item.dart';
import 'package:lagosarchdiocese/ui_widgets/load_web_view.dart';
import 'package:lagosarchdiocese/utils/constants.dart';

class NewsPage extends StatefulWidget {
  static const String id = 'news_page';
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<dynamic> items = [1, 2, 3, 4, 5, 6, 6, 8, 9, 10];
  List<Column> _myListView(BuildContext context) {
    List<Column> listItems = [];
    for (int index = 0; index < items.length; index++) {
      listItems.add(Column(
        children: <Widget>[
          ListItem(
            onTap: () {},
            child: ListItemSide(
              title: 'Prayers',
              brief: 'Hello all',
              date: 'Joly 30, 2020 : 10:00',
            ),
          ),
          SizedBox(
            height: 5.0,
          )
        ],
      ));
    }
    return listItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          BackgroundImageContainer(
            height: 350,
            image: networkImageCache(),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                NewsContent(
                  subject:
                      'Archbishop Alfred Adewale Martins 35th Ordination Anniversery (Press Release)',
                  content:
                      'Cras gravida bibendum dolor eu varius.  Ipsum fermentum velit nisl, eget vehicula.Cras gravida bibendum dolor eu varius.  Ipsum fermentum velit nisl, eget vehicula.Cras gravida bibendum dolor eu varius.  Ipsum fermentum velit nisl',
                ),
                SizedBox(
                  height: 20.0,
                ),
                StackedImages(
                  urls: [null, null, null],
                  text: '3 days ago',
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: Effects(
                      likes: 10,
                      shares: 10,
                      comments: 10,
                    )),
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.bookmark,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          ..._myListView(context),
        ],
      ),
    );
  }
}

class NewsContent extends StatelessWidget {
  final String subject;
  final String content;
  const NewsContent({this.subject, this.content});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: 20.0,
        ),
        Text(
          subject,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
        ),
        SizedBox(
          height: 20.0,
        ),
        LoadWebView(data: content),
      ],
    );
  }
}

class LeftSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('left'),
    );
  }
}

class RightSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('right'),
    );
  }
}

class StackedImages extends StatelessWidget {
  final String text;
  final List<String> urls;
  const StackedImages({this.urls = const [], this.text});

  List<Widget> _populateImages() {
    List<Widget> images = [];
    double step = 27;
    if (urls.length > 0) {
      images.add(CircleImage(
        url: urls[0],
        radius: 22,
      ));
      for (int i = 1; i < urls.length; i++) {
        images.add(Positioned(
          left: step,
          child: CircleImage(
            url: urls[i],
            radius: 22,
          ),
        ));
        step += step;
      }
    }
    return images;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      child: Stack(
        children: [
          Container(),
          ..._populateImages(),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              text,
              style: TextStyle(fontSize: 12.0),
            ),
          )
        ],
      ),
    );
  }
}

class Effects extends StatelessWidget {
  final int likes;
  final int shares;
  final int comments;
  const Effects({this.likes, this.shares, this.comments});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        EffectItem(
          icon: Icon(
            Icons.favorite,
            color: Colors.red,
            size: 15,
          ),
          count: likes,
        ),
        SizedBox(
          width: 7.0,
        ),
        EffectItem(
          icon: SvgPicture.asset(
            '${kImageUrl}chat_bubble.svg',
            color: Colors.black,
            width: 12,
            height: 12,
          ),
          count: comments,
        ),
        SizedBox(
          width: 7.0,
        ),
        EffectItem(
          icon: SvgPicture.asset(
            '${kImageUrl}share.svg',
            color: Colors.black,
            width: 12,
            height: 12,
          ),
          count: shares,
        ),
      ],
    );
  }
}

class EffectItem extends StatelessWidget {
  final Widget icon;
  final int count;
  const EffectItem({this.icon, this.count});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        icon,
        SizedBox(
          width: 3.0,
        ),
        Text(
          count == null ? 0.toString() : count.toString(),
          style: TextStyle(fontSize: 12.0),
        )
      ],
    );
  }
}
