import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lagosarchdiocese/models/deanery.dart';
import 'package:lagosarchdiocese/models/donation.dart';
import 'package:lagosarchdiocese/models/donor.dart';
import 'package:lagosarchdiocese/models/news.dart';
import 'package:lagosarchdiocese/models/occasion.dart';
import 'package:lagosarchdiocese/models/parish.dart';
import 'package:lagosarchdiocese/models/quote.dart';
import 'package:lagosarchdiocese/models/reflection.dart';
import 'package:lagosarchdiocese/providers/provider_list.dart';
import 'package:lagosarchdiocese/screens/splash_screen.dart';
import 'package:lagosarchdiocese/utils/app_routes.dart';
import 'package:provider/provider.dart';
import 'models/app_model.dart';
import 'models/user_model.dart';
import 'utils/theme_data.dart';
import 'package:path_provider/path_provider.dart' as pp;

//Main is the entry to our app
void main() async {
  await _openHive();
  runApp(
    //This is our root component
    Larch(),
  );
}

_openHive() async {
  WidgetsFlutterBinding.ensureInitialized();
  var appDocDir = await pp.getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(AppModelAdapter());
  Hive.registerAdapter(DeaneryAdapter());
  Hive.registerAdapter(DonationAdapter());
  Hive.registerAdapter(DonorAdapter());
  Hive.registerAdapter(NewsAdapter());
  Hive.registerAdapter(OccasionAdapter());
  Hive.registerAdapter(ParishAdapter());
  Hive.registerAdapter(QuoteAdapter());
  Hive.registerAdapter(ReflectionAdapter());
}

class Larch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: MaterialApp(
        theme: myThemeData(context),
        debugShowCheckedModeBanner: false,
        title: 'Cath. Arch. of Lagos',
        initialRoute: SplashScreen.id,
        routes: appRoutes,
      ),
    );
  }
}
