import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/helpers/background_image_container.dart';
import 'package:lagosarchdiocese/ui_widgets/parish_detail.dart';
import 'package:lagosarchdiocese/utils/constants.dart';
import '../ui_widgets/my_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParishViewPage extends StatelessWidget {
  static const String id = 'parish_page_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        MyMap(
          center: const LatLng(6.4499, 3.3966),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: NavBar(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomItem(),
        )
      ],
    ));
  }
}

class BottomItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Expanded(
            child: BackgroundImageContainer(
              hasShadow: true,
              image: AssetImage('${kImageUrl}laap_church_default.jpg'),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              child: ParishDetail(
                name: 'St Mary\'s Catholic Church',
                address: '7 Ire Akari Estate, Ilasamaja',
                telephone: '08038714611',
                email: 'nwisuchisom@gmail.com',
                mass: _loadHTML(),
                confession: _loadHTML(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String _loadHTML() {
  return '<p>Goodness gracious</p>'
      '<p>Goodness gracious</p>';
}

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: kAppPaddingHorizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back,
                color: kTextColor,
              ),
            ),
            Text(
              'DIRECTION',
              textAlign: TextAlign.center,
              style: kNavText,
            ),
            Icon(Icons.more_vert, color: kTextColor),
          ],
        ),
      ),
    );
  }
}
