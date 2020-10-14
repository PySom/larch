import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/models/parish.dart';
import 'package:lagosarchdiocese/ui_widgets/parish_detail.dart';
import 'package:lagosarchdiocese/utils/constants.dart';
import '../ui_widgets/my_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParishViewPage extends StatefulWidget {
  static const String id = 'parish_page_screen';

  @override
  _ParishViewPageState createState() => _ParishViewPageState();
}

class _ParishViewPageState extends State<ParishViewPage>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  double multiplier = 0.6;

  Animation animation;

  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  _onPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying ? controller.forward() : controller.reverse();
      if (isPlaying) {
        multiplier = 0.09;
      } else {
        multiplier = 0.6;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Parish parish = ModalRoute.of(context).settings.arguments;
    print('parish is $parish');
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        MyMap(
          center: LatLng(parish.latitude, parish.longitude),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: NavBar(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            overflow: Overflow.visible,
            children: [
              BottomItem(
                parish: parish,
                multiplier: multiplier,
              ),
              Positioned(
                top: -16,
                right: 20,
                child: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: AnimatedIcon(
                      color: Colors.black,
                      icon: AnimatedIcons.close_menu,
                      progress: controller,
                    ),
                  ),
                  onTap: () => _onPressed(),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}

class BottomItem extends StatelessWidget {
  final Parish parish;
  final double multiplier;
  const BottomItem({this.multiplier, this.parish});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * multiplier,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          // Expanded(
          //   child: BackgroundImageContainer(
          //     hasShadow: true,
          //     image: AssetImage('${kImageUrl}laap_church_default.jpg'),
          //   ),
          // ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              child: ParishDetail(
                name: parish?.name ?? '',
                address: parish?.address ?? '',
                telephone: parish?.phone ?? '',
                email: parish?.email ?? '',
                mass: parish?.massDetail ?? '',
                confession: parish?.confessionDetail ?? '',
              ),
            ),
          ),
        ],
      ),
    );
  }
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
