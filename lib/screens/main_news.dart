import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/helpers/padded_widget.dart';
import 'package:lagosarchdiocese/models/news.dart' as models;
import 'package:lagosarchdiocese/utils/constants.dart';

import 'news_page.dart';

class MainNews extends StatelessWidget {
  static const String id = 'main_news';
  @override
  Widget build(BuildContext context) {
    final models.News news = ModalRoute.of(context).settings.arguments;
    print(news.image);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            News(
              child: SafeArea(
                child: Padded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                    ],
                  ),
                ),
              ),
              image: news.image,
              subject: news.title,
              content: news.content,
              stackedImages: [null, null, null],
              date:
                  news.datePosted != null ? news.datePosted.split('T')[0] : '',
              likes: 0,
              comments: 0,
              shares: 0,
            ),
          ],
        ),
      ),
    );
  }
}
