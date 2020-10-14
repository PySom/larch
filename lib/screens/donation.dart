import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/helpers/layout.dart';
import 'package:lagosarchdiocese/helpers/network_image_cache.dart';
import 'package:lagosarchdiocese/helpers/padded_widget.dart';
import 'package:lagosarchdiocese/models/donation.dart';
import 'package:lagosarchdiocese/models/pay_model.dart';
import 'package:lagosarchdiocese/models/user_model.dart';
import 'package:lagosarchdiocese/providers/app_data_provider.dart';
import 'package:lagosarchdiocese/providers/auth_provider.dart';
import 'package:lagosarchdiocese/screens/payment_page.dart';
import 'package:lagosarchdiocese/ui_widgets/future_helper.dart';
import '../utils/constants.dart';

class DonationPage extends StatefulWidget {
  static const String id = 'donation_page_screen';

  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  String name;
  String phone;
  String email;
  double amount;

  final _formKey = GlobalKey<FormState>();
  Donation _donation;
  List<Donation> _donations = [Donation(title: '-- Select a donation --')];
  Future<List<Donation>> futureDonations;
  Future<List<Donation>> _getDonations() async {
    List<Donation> result =
        await AppData.appDataProvider(context).getDonations();
    setState(() {
      _donations = [..._donations, ...result];
      print('donation is ${_donations.first.title}');
      if (_donations.length > 0) {
        _donation = _donations.first;
      }
    });
    return Future.value(result);
  }

  @override
  void initState() {
    futureDonations = _getDonations();
    User user = Auth.authProvider(context).user;
    if (user != null) {
      name = user.fullName;
      email = user.email;
      phone = user.phoneNumber;
    }
    amount = 1000.0;
    super.initState();
  }

  Widget _dropdown() {
    print(_donation);
    return DropdownButton<String>(
      value: _donation?.title ?? '',
      dropdownColor: Colors.white,
      icon: Icon(
        Icons.arrow_downward,
        color: kAccentColor,
      ),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: kAccentColor),
      underline: Container(
        height: 2,
        color: kAccentColor,
      ),
      onChanged: (String newValue) {
        setState(() {
          _donation =
              _donations.firstWhere((donation) => donation.title == newValue);
        });
      },
      items: _donations.map<DropdownMenuItem<String>>((Donation donation) {
        return DropdownMenuItem<String>(
          value: donation.title,
          child: Text(donation.title),
        );
      }).toList(),
    );
  }

  Column _getExtras() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (_donation.image != null)
          Image(
            image: networkImageCache(url: '$kBaseUrl/${_donation.image}'),
          ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          _donation.content,
          style: kLabelUnitStyle,
        ),
        SizedBox(height: 15.0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    AppData.appDataProvider(context).setLastRoute(DonationPage.id);
    return Layout(
      title: "DONATION",
      children: <Widget>[
        Padded(
          child: FutureHelper<List<Donation>>(
              task: futureDonations,
              builder: (context, donations) {
                print('done');
                return Column(
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
                      padding:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _dropdown(),
                              ],
                            ),
                            if (_donation.content != null) _getExtras(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Name",
                                  style: kLabelBodyLittleStyle,
                                ),
                                TextFormField(
                                  initialValue: name,
                                  onChanged: (value) {
                                    setState(() {
                                      name = value;
                                    });
                                  },
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
                                  initialValue: email,
                                  onChanged: (value) {
                                    setState(() {
                                      email = value;
                                    });
                                  },
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
                                  initialValue: phone,
                                  onChanged: (value) {
                                    setState(() {
                                      phone = value;
                                    });
                                  },
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Amount",
                                  style: kLabelBodyLittleStyle,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  initialValue: amount.toString(),
                                  onChanged: (value) {
                                    setState(() {
                                      amount = double.parse(value);
                                    });
                                  },
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
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: RaisedButton(
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        if (_donation.content == null) {
                                          Flushbar(
                                            backgroundColor: kAccentColor,
                                            message: 'Please choose a donation',
                                            duration: Duration(seconds: 3),
                                            flushbarStyle:
                                                FlushbarStyle.GROUNDED,
                                          ).show(context);
                                          return;
                                        }
                                        FocusManager.instance.primaryFocus
                                            .unfocus();
                                        PayModel payModel = PayModel(
                                          name: name,
                                          email: email,
                                          phone: phone,
                                          amount: amount,
                                          donation: _donation.title,
                                          donationId: _donation.id,
                                        );
                                        Navigator.of(context).pushNamed(
                                            PaymentPage.id,
                                            arguments: payModel);
                                      }
                                    },
                                    child: Text(
                                      'Donate',
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
                );
              }),
        ),
      ],
    );
  }
}
