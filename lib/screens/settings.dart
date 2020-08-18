import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/helpers/layout.dart';
import 'package:lagosarchdiocese/helpers/padded_widget.dart';
import 'package:lagosarchdiocese/ui_widgets/circle_image.dart';
import 'package:lagosarchdiocese/ui_widgets/nav_bar_filler.dart';
import 'package:lagosarchdiocese/utils/constants.dart';

class Settings extends StatefulWidget {
  static const String id = 'settings';
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      title: '',
      children: [
        Stack(
          children: [
            NavBarFiller(),
            Align(
              child: CircleImage(
                radius: 40.0,
              ),
              alignment: Alignment.center,
            ),
          ],
        ),
        SizedBox(
          height: 15.0,
        ),
        Column(
          children: [
            SizedBox(
              width: double.infinity,
            ),
            Text(
              'Anonymous user',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(
              'Lagos, Nigeria',
              style: TextStyle(
                color: kTextColor.withOpacity(0.5),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Column(
          children: [
            Padded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email'),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'youremail@email.com',
                      fillColor: Colors.transparent,
                      contentPadding: EdgeInsets.zero,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Name'),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: 'Cyprian Iwene Tansi',
                      fillColor: Colors.transparent,
                      contentPadding: EdgeInsets.zero,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Discard changes',
                              style: TextStyle(
                                color: kTextColor.withOpacity(0.5),
                              ),
                            ),
                          ),
                          OutlineButton(
                            borderSide: BorderSide(color: Colors.black),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 7.0, vertical: 7.0),
                              child: Text(
                                'Save changes',
                                style: TextStyle(
                                  color: kTextColor.withOpacity(0.5),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
      bottomItem: Padded(
        child: GestureDetector(
          onTap: () {},
          child: Text(
            'Log out',
            style: TextStyle(
              color: kTextColor.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}