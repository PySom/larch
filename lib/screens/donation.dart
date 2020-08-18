import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/helpers/layout.dart';
import 'package:lagosarchdiocese/helpers/padded_widget.dart';
import '../utils/constants.dart';

class DonationPage extends StatelessWidget {
  static const String id = 'donation_page_screen';
  @override
  Widget build(BuildContext context) {
    return Layout(
      title: "Donation",
      children: <Widget>[
        Padded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "You could pay into any of our bank accounts",
                style: kLabelUnitStyle,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "BANK NAME: ZENITH BANK",
                style: kLabelBodyLittleStyle,
              ),
              Text(
                "ACCOUNT NAME: CATHOLIC ARCHDIOCESE OF LAGOS",
                style: kLabelBodyLittleStyle,
              ),
              Text(
                "ACCOUNT NO: 1014676397",
                style: kLabelBodyLittleStyle,
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                "Or Donate Online using our Payment Platform",
                style: kLabelUnitStyle,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Name",
                            style: kLabelBodyLittleStyle,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Full Name',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Email Address",
                            style: kLabelBodyLittleStyle,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: 'youremail@email.com',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Phone Number",
                            style: kLabelBodyLittleStyle,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              hintText: '080********',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: RaisedButton(
                              onPressed: () {
                                // Validate will return true if the form is valid, or false if
                                // the form is invalid.
//                                if (_formKey.currentState.validate()) {
//                                  // Process data.
//                                }
                              },
                              child: Text(
                                'Submit',
                                style: kButtonTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
