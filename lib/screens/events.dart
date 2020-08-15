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
  List<dynamic> items = [1, 2, 3, 4, 5, 6, 6, 8, 9, 10];
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
                  ListItemSide(
                    title: 'Prayers',
                    brief: 'Hello all',
                    date: 'Joly 30, 2020 : 10:00',
                  ),
                  if (index == items.length - 1)
                    SvgPicture.asset(
                      '${kImageUrl}alarm-clock.svg',
                      width: 40.0,
                      height: 40.0,
                      color: Colors.black,
                    ),
                ],
              ),
            ),
            if (_index == index)
              ListSubItem(
                color: Colors.white,
                image:
                    'https://static01.nyt.com/images/2020/05/31/us/politics/31dc-virus-scotus/merlin_170520402_b9c7ce69-5b2d-4627-8957-1a866d9d9b06-jumbo.jpg?quality=90&auto=webp',
                title: 'Prayer before meal',
                subtitle: 'A thanksgiving to God for provision',
                content:
                    'Bless us Oh Lord and this your gift which we are about to receive from your bounty through Christ Our Lord, Amen',
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
      title: 'Events',
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
