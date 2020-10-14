import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lagosarchdiocese/helpers/static_layout.dart';
import 'package:lagosarchdiocese/models/occasion.dart';
import 'package:lagosarchdiocese/providers/app_data_provider.dart';
import 'package:lagosarchdiocese/ui_widgets/future_helper.dart';
import 'package:lagosarchdiocese/ui_widgets/list_item.dart';
import 'package:lagosarchdiocese/ui_widgets/nav_bar_filler.dart';
import 'package:lagosarchdiocese/utils/constants.dart';

class EventPage extends StatefulWidget {
  static const String id = 'event_screen';
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  Future<List<Occasion>> futureEvents;

  @override
  void initState() {
    futureEvents = AppData.appDataProvider(context).getEvents();
    super.initState();
  }

  int _index = DEFAULT;

  bool _eventIsToday(String date) {
    if (date == null) return false;
    DateTime thisDay = DateTime.parse(date);
    Duration diff = DateTime.now().difference(thisDay);
    if (diff.inDays > 1) return false;
    return true;
  }

  List<Column> _myListView(BuildContext context, List<Occasion> items) {
    List<Column> listItems = [];
    for (int index = 0; index < items.length; index++) {
      Occasion item = items[index];
      print('title is ${item.image}');
      listItems.add(
        Column(
          children: <Widget>[
            ListItem(
              color: Colors.white,
              onTap: () {
                setState(() {
                  if (_index == index) {
                    _index = DEFAULT;
                    return;
                  }
                  _index = index;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: ListItemSide(
                      title: item.title ?? '',
                      brief: item.brief ?? '',
                      date: item.startDate ?? '',
                    ),
                  ),
                  if (_eventIsToday(item.startDate))
                    Row(
                      children: [
                        SizedBox(
                          width: 5.0,
                        ),
                        SvgPicture.asset(
                          '${kImageUrl}alarm-clock.svg',
                          width: 40.0,
                          height: 40.0,
                          color: Colors.black,
                        ),
                      ],
                    ),
                ],
              ),
            ),
            if (_index == index)
              ListSubItem(
                color: Colors.white,
                image:
                    item.image != null ? '$kBaseUrl/${item.image}' : item.image,
                title: item.title,
                subtitle: item.brief,
                content: item.content,
              ),
            if (_index != index)
              SizedBox(
                height: 10.0,
              )
          ],
        ),
      );
    }
    return listItems;
  }

  @override
  Widget build(BuildContext context) {
    AppData.appDataProvider(context).setLastRoute(EventPage.id);
    return StaticLayout(
      color: kListTileColor,
      title: 'EVENTS',
      children: <Widget>[
        Expanded(
          child: FutureHelper<List<Occasion>>(
              task: futureEvents,
              onRefresh: () async {
                print('refreshing');
                List<Occasion> result =
                    await AppData.appDataProvider(context).refreshEvents();
                setState(() {
                  futureEvents = Future.value(result);
                });
              },
              builder: (context, events) {
                return ListView(
                  children: <Widget>[
                    NavBarFiller(),
                    SizedBox(
                      height: 20.0,
                    ),
                    ..._myListView(context, events),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
