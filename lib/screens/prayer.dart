import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lagosarchdiocese/helpers/background_image_container.dart';
import 'package:lagosarchdiocese/helpers/padded_widget.dart';
import 'package:lagosarchdiocese/helpers/static_layout.dart';
import 'package:lagosarchdiocese/models/prayer.dart';
import 'package:lagosarchdiocese/providers/app_data_provider.dart';
import 'package:lagosarchdiocese/screens/home.dart';
import 'package:lagosarchdiocese/ui_widgets/drawer_view.dart';
import 'package:lagosarchdiocese/ui_widgets/future_helper.dart';
import 'package:lagosarchdiocese/ui_widgets/list_item.dart';
import 'package:lagosarchdiocese/ui_widgets/nav_bar_filler.dart';
import 'package:lagosarchdiocese/utils/constants.dart';
import 'package:lagosarchdiocese/models/prayer_category.dart';

class PrayerPage extends StatefulWidget {
  static const String id = 'prayer_screen_page';
  @override
  _PrayerPageState createState() => _PrayerPageState();
}

class _PrayerPageState extends State<PrayerPage> {
  int _index = DEFAULT;
  List<Widget> _myListView(BuildContext context) {
    List<Widget> listItems = [];
    PrayerCategory prayerCat =
        _prayerCats.firstWhere((element) => element.id == _currentId);
    if (prayerCat != null) {
      List<Prayer> items = prayerCat.prayers;
      for (int index = 0; index < items.length; index++) {
        Prayer item = items[index];
        listItems.add(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListItem(
                image: '${kImageUrl}prayer.jpg',
                onTap: () {
                  setState(() {
                    if (_index == index) {
                      _index = DEFAULT;
                      return;
                    }
                    _index = index;
                  });
                },
                child: ListItemSide(
                  title: item.title,
                  brief: item.title,
                  date: '',
                ),
              ),
              if (_index == index)
                ListSubItem(
                  width: double.infinity,
                  title: '',
                  subtitle: '',
                  content: item.content,
                ),
              if (_index != index)
                SizedBox(
                  height: 5.0,
                )
            ],
          ),
        );
      }
    }
    if (listItems.length == 0) {
      listItems.add(
        Center(
          child: Text('No prayers found'),
        ),
      );
    }
    return listItems;
  }

  List<PrayerCategory> _prayerCats = [];
  int _currentId;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<List<PrayerCategory>> futurePrayers;
  Future<List<PrayerCategory>> futureTask() async {
    List<PrayerCategory> result =
        await AppData.appDataProvider(context).getPrayers();

    setState(() {
      _prayerCats = result;
      _currentId = result.first?.id;
    });
    return Future.value(result);
  }

  @override
  void initState() {
    // TODO: implement initState
    futurePrayers = futureTask();
    super.initState();
  }

  List<Widget> _getPrayerCategories() {
    return _prayerCats
        .map((e) => ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                e.title,
                style: kDrawerItemStyle,
              ),
              onTap: () {
                setState(() {
                  Navigator.of(context).pop();
                  _currentId = e.id;
                });
              },
            ))
        .toList();
  }

  String get _categoryName {
    PrayerCategory prayerCat =
        _prayerCats?.firstWhere((element) => element.id == _currentId);
    return prayerCat?.title;
  }

  @override
  Widget build(BuildContext context) {
    AppData.appDataProvider(context).setLastRoute(PrayerPage.id);
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: Scaffold(
        key: _scaffoldKey,
        drawerScrimColor: Colors.transparent,
        appBar: AppBar(
          title: Text('PRAYERS'),
          centerTitle: true,
        ),
        drawer: DrawerView(
          loner: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Home',
              style: kDrawerItemStyle,
            ),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  HomePage.id, (Route<dynamic> route) => false);
            },
          ),
          header: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Categories',
              style: kDrawerItemStyle.copyWith(fontSize: 20),
            ),
            onTap: () {},
          ),
          children: _getPrayerCategories(),
        ),
        body: FutureHelper<List<PrayerCategory>>(
          task: futurePrayers,
          onRefresh: () async {
            List<PrayerCategory> result =
                await AppData.appDataProvider(context).refreshPrayers();
            setState(() {
              _prayerCats = result;
              futurePrayers = Future.value(result);
            });
          },
          builder: (context, prayers) => Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    NavBarFiller(),
                    BackgroundImageContainer(
                      height: 180.0,
                      image: AssetImage('${kImageUrl}larch_prayer.jpg'),
                    ),
                    Padded(
                      child: Text(
                        _categoryName ?? '',
                        style: kLabelHeaderStyle.copyWith(
                            color: kAccentColor, fontSize: 18),
                      ),
                    ),
                    ..._myListView(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
