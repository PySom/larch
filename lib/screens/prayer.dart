import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/helpers/background_image_container.dart';
import 'package:lagosarchdiocese/helpers/padded_widget.dart';
import 'package:lagosarchdiocese/helpers/static_layout.dart';
import 'package:lagosarchdiocese/ui_widgets/list_item.dart';
import 'package:lagosarchdiocese/ui_widgets/nav_bar_filler.dart';
import 'package:lagosarchdiocese/utils/constants.dart';

class PrayerPage extends StatefulWidget {
  static const String id = 'prayer_screen_page';
  @override
  _PrayerPageState createState() => _PrayerPageState();
}

class _PrayerPageState extends State<PrayerPage> {
  int _index = DEFAULT;
  List<dynamic> items = [1, 2, 3, 4, 5, 6, 6, 8, 9, 10];
  List<Column> _myListView(BuildContext context) {
    List<Column> listItems = [];
    for (int index = 0; index < items.length; index++) {
      listItems.add(Column(
        children: <Widget>[
          ListItem(
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
              title: 'Prayers',
              brief: 'Hello all',
              date: 'Joly 30, 2020 : 10:00',
            ),
          ),
          if (_index == index)
            ListSubItem(
              image:
                  'https://static01.nyt.com/images/2020/05/31/us/politics/31dc-virus-scotus/merlin_170520402_b9c7ce69-5b2d-4627-8957-1a866d9d9b06-jumbo.jpg?quality=90&auto=webp',
              title: 'Prayer before meal',
              subtitle: 'A thanksgiving to God for provision',
              content:
                  'Bless us Oh Lord and this your gift which we are about to receive from your bounty through Christ Our Lord, Amen',
            ),
          if (_index != index)
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
    return StaticLayout(
      title: 'Prayer',
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
                child: Text('Categories'),
              ),
              ..._myListView(context),
            ],
          ),
        ),
      ],
    );
  }
}
