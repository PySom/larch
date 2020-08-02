import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/my_map.dart';
import 'rounded_box.dart';
import 'rounded_box_child.dart';
import 'constants.dart';
import 'scroll_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contact"),
        ),
        body: Flexible(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Address",
                        style: kLabelHeaderStyle,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Catholic Archdiocese of Lagos",
                        style: kLabelBodyStyle,
                      ),
                      Text(
                        "19, Catholic Mission Street",
                        style: kLabelBodyStyle,
                      ),
                      Text(
                        "P.O Box 8, Marina GPO,",
                        style: kLabelBodyStyle,
                      ),
                      Text(
                        "Lagos Nigeria",
                        style: kLabelBodyStyle,
                      ),
                      Text(
                        "101001",
                        style: kLabelBodyStyle,
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        "Email",
                        style: kLabelHeaderStyle,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "info@lagosarchdiocese.org",
                        style: kLabelBodyStyle,
                      ),
                      Text(
                        "arclagos@yahoo.com",
                        style: kLabelBodyStyle,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15.0, horizontal: 0),
                        child: Center(
                          child: Text("www.lagosarchdiocese.org"),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.grey)),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: MyMap(
                      center: const LatLng(6.4499, 3.3966),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
