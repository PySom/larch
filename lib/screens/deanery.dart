import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/helpers/background_image_container.dart';
import 'package:lagosarchdiocese/helpers/network_image_cache.dart';
import 'package:lagosarchdiocese/helpers/padded_widget.dart';
import 'package:lagosarchdiocese/helpers/static_layout.dart';
import 'package:lagosarchdiocese/screens/parish_view.dart';
import 'package:lagosarchdiocese/ui_widgets/nav_bar_filler.dart';
import 'package:lagosarchdiocese/utils/constants.dart';

class DeaneryModel {
  String name;
  List<ParishModel> parishes;
  DeaneryModel({this.name, this.parishes});
}

class ParishModel {
  String name;
  String image;
  String address;
  String phone;
  String email;
  String distance;

  ParishModel(
      {this.name,
      this.address,
      this.phone,
      this.email,
      this.distance,
      this.image});
}

class Deanery extends StatefulWidget {
  static const String id = 'deanery';
  @override
  _DeaneryState createState() => _DeaneryState();
}

class _DeaneryState extends State<Deanery> {
  int pIndexCount = 0;
  List<DeaneryModel> deaneries = [
    DeaneryModel(
      name: 'Apapa',
      parishes: [
        ParishModel(
            name: 'St Mary\'s',
            address: '7 Unity Street Ago Okota',
            phone: '08038714611',
            email: 'nwisuchisom@gmail.com',
            distance: '20km'),
        ParishModel(
            name: 'St Mary\'s',
            address: '7 Unity Street Ago Okota',
            phone: '08038714611',
            email: 'nwisuchisom@gmail.com',
            distance: '20km'),
        ParishModel(
            name: 'St Mary\'s',
            address: '7 Unity Street Ago Okota',
            phone: '08038714611',
            email: 'nwisuchisom@gmail.com',
            distance: '20km'),
      ],
    ),
    DeaneryModel(
      name: 'Apapa',
      parishes: [
        ParishModel(
            name: 'St Mary\'s',
            address: '7 Unity Street Ago Okota',
            phone: '08038714611',
            email: 'nwisuchisom@gmail.com',
            distance: '20km'),
        ParishModel(
            name: 'St Mary\'s',
            address: '7 Unity Street Ago Okota',
            phone: '08038714611',
            email: 'nwisuchisom@gmail.com',
            distance: '20km'),
        ParishModel(
            name: 'St Mary\'s',
            address: '7 Unity Street Ago Okota',
            phone: '08038714611',
            email: 'nwisuchisom@gmail.com',
            distance: '20km'),
      ],
    ),
    DeaneryModel(
      name: 'Apapa',
      parishes: [
        ParishModel(
            name: 'St Mary\'s',
            address: '7 Unity Street Ago Okota',
            phone: '08038714611',
            email: 'nwisuchisom@gmail.com',
            distance: '20km'),
        ParishModel(
            name: 'St Mary\'s',
            address: '7 Unity Street Ago Okota',
            phone: '08038714611',
            email: 'nwisuchisom@gmail.com',
            distance: '20km'),
        ParishModel(
            name: 'St Mary\'s',
            address: '7 Unity Street Ago Okota',
            phone: '08038714611',
            email: 'nwisuchisom@gmail.com',
            distance: '20km'),
      ],
    ),
  ];
  int currentIndex;
  @override
  Widget build(BuildContext context) {
    return StaticLayout(
      title: 'DEANERY',
      children: [
        NavBarFiller(),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              DeaneryModel deanery = deaneries[index];
              return Column(
                children: [
                  DeanListItem(
                    name: deanery.name,
                    color:
                        currentIndex == index ? Colors.white : kListTileColor,
                    isTapped: currentIndex == index,
                    onTap: () {
                      setState(() {
                        if (currentIndex == index) {
                          currentIndex = deaneries.length;
                        } else {
                          currentIndex = index;
                        }
                      });
                    },
                  ),
                  if (currentIndex == index)
                    ...deanery.parishes.map((parish) {
                      pIndexCount = deanery.parishes.indexOf((parish));
                      return Column(
                        children: [
                          DeanListSubItem(
                            color: Colors.white,
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(ParishViewPage.id);
                            },
                            leading: BackgroundImageContainer(
                              image: networkImageCache(url: parish.image),
                              height: 80,
                              width: 80,
                            ),
                            trialing: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(parish.name ?? ''),
                                    TextLine('Address: ', parish.address ?? ''),
                                    TextLine('Phone: ', parish.phone ?? ''),
                                    TextLine('Email: ', parish.email ?? ''),
                                  ],
                                ),
                                TextLine(
                                  'Distance: ',
                                  parish.distance ?? '',
                                  defaultStyle: kLabelTextStyle.copyWith(
                                      color: Color(0xFF5B1314)),
                                ),
                              ],
                            ),
                          ),
                          if (pIndexCount < deanery.parishes.length - 1)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 0.0),
                              child: Divider(
                                thickness: 2.0,
                                color: kListTileColor,
                              ),
                            ),
                        ],
                      );
                    }).toList()
                ],
              );
            },
            itemCount: deaneries.length,
          ),
        ),
      ],
    );
  }
}

class DeanListItem extends StatelessWidget {
  final String name;
  final bool isTapped;
  final Function onTap;
  final Color color;
  const DeanListItem(
      {this.name, this.isTapped, this.onTap, this.color = kListTileColor});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.only(bottom: 5.0),
          color: color,
          child: Padded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(name),
                if (isTapped)
                  Icon(
                    Icons.expand_more,
                    color: Colors.black,
                  ),
              ],
            ),
          )),
    );
  }
}

class DeanListSubItem extends StatelessWidget {
  final Widget leading;
  final Widget trialing;
  final Function onTap;
  final Color color;
  const DeanListSubItem(
      {this.leading, this.trialing, this.onTap, this.color = kListTileColor});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          color: color,
          child: Row(
            children: <Widget>[
              Container(
                child: leading,
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Container(
                  child: trialing,
                ),
              )
            ],
          )),
    );
  }
}

class TextLine extends StatelessWidget {
  final String leadingText;
  final String trailingText;
  final TextStyle defaultStyle;

  TextLine(this.leadingText, this.trailingText,
      {this.defaultStyle = kListSubTextStyle});
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: defaultStyle,
        children: [
          TextSpan(
            text: leadingText,
            style: defaultStyle.copyWith(fontWeight: FontWeight.w600),
          ),
          TextSpan(
            text: trailingText,
          ),
        ],
      ),
    );
  }
}
