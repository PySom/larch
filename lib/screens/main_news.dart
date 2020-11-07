import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/helpers/layout.dart';
import 'package:lagosarchdiocese/helpers/static_layout.dart';
import 'package:lagosarchdiocese/models/news.dart' as models;
import 'package:lagosarchdiocese/providers/app_data_provider.dart';
import 'package:lagosarchdiocese/ui_widgets/future_helper.dart';

import 'news_page.dart';

class MainNews extends StatefulWidget {
  final dynamic data;
  static const String id = 'main_news';
  MainNews({this.data});

  @override
  _MainNewsState createState() => _MainNewsState();
}

class _MainNewsState extends State<MainNews> {
  bool _isEmpty = true;
  Future<models.News> futureNews;

  Future<models.News> futureTask(data) async {
    var result = await _getNews(data);
    setState(() {
      _isEmpty = result == null;
    });
    return Future.value(result);
  }

  @override
  void initState() {
    futureNews = futureTask(widget.data);
    print('I did come');
    super.initState();
  }

  T _cast<T>(dynamic data) => data is T ? data : null;

  Future<models.News> _getNews(data) {
    models.News thisNews = _cast<models.News>(data);
    if (thisNews != null) return Future.value(thisNews);
    int id = int.tryParse(data);
    print('id is $id');
    if (id == null) {
      return null;
    } else {
      return AppData.appDataProvider(context).getNewsWithId(id);
    }
  }

  Widget _showNews(models.News news) {
    return NewsScroll(
      onNavBackTap: () {
        Navigator.of(context).pushNamedAndRemoveUntil(
            NewsPage.id, (Route<dynamic> route) => false);
      },
      image: news?.image,
      children: [
        News(
          subject: news.title,
          content: news.content,
          stackedImages: [null, null, null],
          date: news.datePosted != null ? news.datePosted.split('T')[0] : '',
          likes: 0,
          comments: 0,
          shares: 0,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context, route: NewsPage.id),
      child: Scaffold(
        appBar:
            _isEmpty ? customAppBar(context, 'NEWS', route: NewsPage.id) : null,
        body: FutureHelper<models.News>(
          task: futureNews,
          builder: (context, news) {
            return news == null ? NoItem() : _showNews(news);
          },
        ),
      ),
    );
  }
}
