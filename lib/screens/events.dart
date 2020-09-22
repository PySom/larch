import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lagosarchdiocese/helpers/static_layout.dart';
import 'package:lagosarchdiocese/ui_widgets/list_item.dart';
import 'package:lagosarchdiocese/ui_widgets/nav_bar_filler.dart';
import 'package:lagosarchdiocese/utils/constants.dart';

class EventPage extends StatefulWidget {
  static const String id = 'event_screen';
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  int _index = DEFAULT;
  List<dynamic> items = [
    1,
  ];
  List<Column> _myListView(BuildContext context) {
    List<Column> listItems = [];
    for (int index = 0; index < items.length; index++) {
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
                      title: 'Anniversary',
                      brief: 'Anniversary of The Archbishop',
                      date: 'September 12, 2020 : 10:00',
                    ),
                  ),
                  if (index == items.length - 1)
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
                image: 'https://lagosarchdiocese.org/picfornews/g431.jpg',
                title: 'Anniversary',
                subtitle: 'Anniversary of The Archbishop',
                content:
                    'Today is the 8th anniversary of the Installation of Archbishop Alfred Adewale Martins as the 4th Archbishop of Lagos. We thank the good Lord for the graces bestowed upon him in these past seven years as our Chief Shepherd. '
                    'Join the Mass at 12pm on Lumen Christi, DSTV Channel 350 & online at <a href="www.chrismmasslagos.com">www.chrismmasslagos.com</a>',
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
    return StaticLayout(
      color: kListTileColor,
      title: 'EVENTS',
      children: <Widget>[
        Expanded(
          child: ListView(
            children: <Widget>[
              NavBarFiller(),
              SizedBox(
                height: 20.0,
              ),
              ..._myListView(context),
            ],
          ),
        ),
      ],
    );
  }
}
