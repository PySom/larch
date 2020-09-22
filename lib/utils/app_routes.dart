import 'package:lagosarchdiocese/screens/home.dart';
import 'package:lagosarchdiocese/screens/auth/login.dart';
import 'package:lagosarchdiocese/screens/auth/signup.dart';
import 'package:lagosarchdiocese/screens/deanery.dart';
import 'package:lagosarchdiocese/screens/events.dart';
import 'package:lagosarchdiocese/screens/main_news.dart';
import 'package:lagosarchdiocese/screens/news_page.dart';
import 'package:lagosarchdiocese/screens/onboarding/onboarding.dart';
import 'package:lagosarchdiocese/screens/payment_page.dart';
import 'package:lagosarchdiocese/screens/reflections.dart';
import 'package:lagosarchdiocese/screens/settings.dart';
import 'package:lagosarchdiocese/screens/splash_screen.dart';
import '../screens/address.dart';
import '../screens/donation.dart';
import '../screens/home.dart';
import '../screens/parish_view.dart';
import '../screens/prayer.dart';

var appRoutes = {
  HomePage.id: (context) => HomePage(),
  AddressPage.id: (context) => AddressPage(),
  DonationPage.id: (context) => DonationPage(),
  ParishViewPage.id: (context) => ParishViewPage(),
  PrayerPage.id: (context) => PrayerPage(),
  EventPage.id: (context) => EventPage(),
  NewsPage.id: (context) => NewsPage(),
  MainNews.id: (context) => MainNews(),
  Deanery.id: (context) => Deanery(),
  Settings.id: (context) => Settings(),
  Reflection.id: (context) => Reflection(),
  Onboarding.id: (context) => Onboarding(),
  LoginScreen.id: (context) => LoginScreen(),
  SignUpScreen.id: (context) => SignUpScreen(),
  SplashScreen.id: (context) => SplashScreen(),
  PaymentPage.id: (context) => PaymentPage()
};
