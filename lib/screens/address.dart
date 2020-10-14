import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/helpers/layout.dart';
import 'package:lagosarchdiocese/helpers/padded_widget.dart';
import 'package:lagosarchdiocese/providers/app_data_provider.dart';
import '../helpers/background_image_container.dart';
import '../utils/constants.dart';

class AddressPage extends StatelessWidget {
  static const String id = 'address_page_screen';
  @override
  Widget build(BuildContext context) {
    AppData.appDataProvider(context).setLastRoute(AddressPage.id);
    return Layout(
      title: "CONTACT",
      children: <Widget>[
        Padded(
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
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 0),
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
        BackgroundImageContainer(
          height: 250.0,
          image: AssetImage('${kImageUrl}larch_map.jpg'),
        ),
      ],
    );
  }
}
