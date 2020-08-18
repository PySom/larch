import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/helpers/background_image_container.dart';
import 'package:lagosarchdiocese/helpers/network_image_cache.dart';
import 'package:lagosarchdiocese/helpers/padded_widget.dart';
import 'package:lagosarchdiocese/helpers/static_layout.dart';
import 'package:lagosarchdiocese/screens/deanery.dart';
import 'package:lagosarchdiocese/screens/news_page.dart';
import 'package:lagosarchdiocese/ui_widgets/load_web_view.dart';
import 'package:lagosarchdiocese/ui_widgets/nav_bar_filler.dart';
import 'package:lagosarchdiocese/utils/constants.dart';

class ReflectionModel {
  String image;
  String title;
  String author;
  String content;
  int likes;
  List<String> imageUrls;
  ReflectionModel(
      {this.image,
      this.content,
      this.title,
      this.author,
      this.imageUrls,
      this.likes});
}

class Reflection extends StatelessWidget {
  static const String id = 'reflections';
  final List<ReflectionModel> reflections = [
    ReflectionModel(
        title: 'Call to focus on Christ',
        author: 'Fr Mike',
        likes: 3142,
        content:
            '<p>Hello all my name is mr gotzie<br/>Cras gravida bibendum dolor eu varius.  Ipsum fermentum velit nisl, eget vehicula.Cras gravida bibendum dolor eu varius.  Ipsum fermentum </p> ',
        imageUrls: [null, null]),
    ReflectionModel(
        title: 'Call to focus on Christ',
        author: 'Fr Mike',
        likes: 3142,
        content:
            '<p>Hello all my name is mr gotzie<br/>Cras gravida bibendum dolor eu varius.  Ipsum fermentum velit nisl, eget vehicula.Cras gravida bibendum dolor eu varius.  Ipsum fermentum </p> ',
        imageUrls: [null, null]),
    ReflectionModel(
        title: 'Call to focus on Christ',
        author: 'Fr Mike',
        likes: 3142,
        content:
            '<p>Hello all my name is mr gotzie<br/>Cras gravida bibendum dolor eu varius.  Ipsum fermentum velit nisl, eget vehicula.Cras gravida bibendum dolor eu varius.  Ipsum fermentum </p> ',
        imageUrls: [null, null]),
  ];

  @override
  Widget build(BuildContext context) {
    return StaticLayout(
      title: 'REFLECTION',
      children: [
        NavBarFiller(),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              ReflectionModel reflection = reflections[index];
              return ReflectionItem(
                title: reflection.title ?? '',
                image: reflection.image,
                imageUrls: reflection.imageUrls,
                author: reflection.author ?? '',
                likes: reflection.likes?.toString(),
                content: reflection.content ?? '',
              );
            },
            itemCount: reflections.length,
          ),
        )
      ],
    );
  }
}

class ReflectionItem extends StatelessWidget {
  final String image;
  final String title;
  final String author;
  final String content;
  final Color color;
  final String likes;
  final List<String> imageUrls;
  ReflectionItem(
      {this.image,
      this.title,
      this.content,
      this.author,
      this.imageUrls,
      this.likes,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Padded(
      child: Container(
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BackgroundImageContainer(
                  height: 140.0,
                  image: networkImageCache(url: image),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
            Padded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style:
                        kLabelHeaderStyle.copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  LoadWebView(
                    data: content,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    author,
                    style: kListTextStyle.copyWith(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              color: kListTileColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (imageUrls != null && imageUrls.length > 0)
                    Expanded(
                      child: StackedImages(
                        urls: imageUrls,
                        extra: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 22,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  Expanded(
                    child: TextLine(
                      likes == null ? 0.toString() : likes,
                      ' liked this',
                      defaultStyle:
                          TextStyle(fontSize: 12.0, color: Colors.black),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
