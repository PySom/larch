import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/helpers/background_image_container.dart';
import 'package:lagosarchdiocese/helpers/network_image_cache.dart';
import 'package:lagosarchdiocese/helpers/padded_widget.dart';
import 'package:lagosarchdiocese/helpers/static_layout.dart';
import 'package:lagosarchdiocese/models/reflection.dart' as models;
import 'package:lagosarchdiocese/providers/app_data_provider.dart';
import 'package:lagosarchdiocese/screens/deanery.dart';
import 'package:lagosarchdiocese/screens/news_page.dart';
import 'package:lagosarchdiocese/ui_widgets/future_helper.dart';
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

class Reflection extends StatefulWidget {
  static const String id = 'reflections';

  @override
  _ReflectionState createState() => _ReflectionState();
}

class _ReflectionState extends State<Reflection> {
  Future<List<models.Reflection>> futureReflections;

  @override
  void initState() {
    futureReflections = AppData.appDataProvider(context).getReflections();
    super.initState();
  }

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
          child: FutureHelper<List<models.Reflection>>(
              task: futureReflections,
              onRefresh: () async {
                print('refreshing');
                List<models.Reflection> result =
                    await AppData.appDataProvider(context).refreshReflections();
                setState(() {
                  futureReflections = Future.value(result);
                });
              },
              builder: (context, reflections) {
                print('strange things');
                return reflections.length == 0
                    ? ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          NoItem(),
                        ],
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          print('weird');
                          models.Reflection reflection = reflections[index];
                          print('reflection is ${reflections.length}');
                          return ReflectionItem(
                            title: reflection.title ?? '',
                            image: reflection.image,
                            author: 'Archdiocese',
                            content: reflection.content ?? '',
                          );
                        },
                        itemCount: reflections.length,
                      );
              }),
        ),
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
      this.color = kListTileColor});

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
                  image: networkImageCache(url: '$kBaseUrl/$image'),
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
            // Container(
            //   padding: EdgeInsets.all(10.0),
            //   color: kListTileColor,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       if (imageUrls != null && imageUrls.length > 0)
            //         Expanded(
            //           child: StackedImages(
            //             urls: imageUrls,
            //             extra: CircleAvatar(
            //               backgroundColor: Colors.red,
            //               radius: 22,
            //               child: Icon(
            //                 Icons.favorite,
            //                 color: Colors.white,
            //               ),
            //             ),
            //           ),
            //         ),
            //       Expanded(
            //         child: TextLine(
            //           likes == null ? 0.toString() : likes,
            //           ' liked this',
            //           defaultStyle:
            //               TextStyle(fontSize: 12.0, color: Colors.black),
            //         ),
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
