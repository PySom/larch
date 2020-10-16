import 'package:flutter/material.dart';

const double kBottomContainerHeight = 80.0;
const String kImageUrl = 'images/';
const String kDefaultUserImage = 'default_user.jpg';
const String kDefaultBgImage = 'default_user.jpg';
const int DEFAULT = 200;

const double kMinimumHeight = 120.0;
const double kMaximumHeight = 220.0;
const EdgeInsets kAppPaddingHorizontal = EdgeInsets.symmetric(horizontal: 8.0);
const EdgeInsets kAppPaddingVertical = EdgeInsets.symmetric(vertical: 8.0);
const EdgeInsets kAppPadding =
    EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0);
const EdgeInsets kHomeTopBgPadding =
    EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0);

const Color kListTileColor = Color(0xFFF3F3F3);
const Color kOffWhite = Color(0xFFf5f5f5);
const Color kPrimaryColor = Colors.white;
const Color kDrawerColor = Color(0xFF002252);
const Color kAccentColor = Color(0xFF003C8B);
const Color kTextColor = Colors.black;
const Color kListTextColor = Color(0xFF646464);
const Color kOutlineButtonBorderColor = Color(0xFF030F29);
const Color kButtonColor = Color(0xFFD19100);
const Color kInActiveColor = Color(0xFF013C8B);
const Color kRoundedBoxColor = Color(0xFF111328);
const Color kFadedRoundedBoxColor = Color(0xFF1D1E33);
const Color kBottomContainerColor = Color(0xFFEB1555);
const Color kRoundedIconColor = Color(0xFFF3F3F3);
const Color kFadedBottomContainerColor = Color(0x29EB1555);
const double kSizedBoxHeight = 5.0;

const TextStyle kNavText =
    TextStyle(fontFamily: 'SFPro', fontWeight: FontWeight.w600);

const TextStyle kListTextStyle = TextStyle(
  fontSize: 14.0,
  color: kListTextColor,
  fontFamily: "Poppins",
);

const TextStyle kLabelTextStyle = TextStyle(
  fontSize: 10.0,
  color: kInActiveColor,
  fontFamily: "Poppins",
);

const TextStyle kListSubTextStyle = TextStyle(
  fontSize: 10.0,
  color: kTextColor,
  fontFamily: "Poppins",
);

const TextStyle kButtonTextStyle = TextStyle(color: kPrimaryColor);
const TextStyle kDrawerItemStyle =
    TextStyle(color: kPrimaryColor, fontSize: 16.0);

const TextStyle kParishLabelStyle = TextStyle(
  fontSize: 18.0,
  color: kPrimaryColor,
  fontWeight: FontWeight.w900,
  fontFamily: "Poppins",
);

const TextStyle kLabelHeaderStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.black,
  fontWeight: FontWeight.w700,
  fontFamily: "Poppins",
);

const TextStyle kLabelBodyStyle = TextStyle(
  fontSize: 16.0,
  color: Colors.black,
  fontWeight: FontWeight.w400,
  fontFamily: "Poppins",
);

const TextStyle kLabelBodyLittleStyle = TextStyle(
  fontSize: 16.0,
  color: Colors.black,
  fontWeight: FontWeight.w400,
  fontFamily: "Poppins",
);
const TextStyle kLabelUnitStyle = TextStyle(
  fontSize: 12.0,
  color: Color(0XFF451311),
  fontWeight: FontWeight.w900,
  fontFamily: "Poppins",
);

//app url
const String kBaseUrl = 'https://catholicarchlag.org';
const String kPayUrl = '$kBaseUrl/pay';
const String kAppAPIUrl = '$kBaseUrl/api';

Map<String, String> _headers(String token) {
  return {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Authorization": "Bearer $token"
  };
}

const kHeaders = _headers;

const String kUserName = 'user';
const String kAppDataName = 'appData';
const String kDeanery = 'deanery_hive';
const String kDonation = 'donation_hive';
const String kDonor = 'donor_hive';
const String kNews = 'news_hive';
const String kOccasion = 'occasion_hive';
const String kParish = 'parish_hive';
const String kQuote = 'quote_hive';
const String kReflection = 'reflection_hive';
const String kPrayer = 'prayer_hive';
