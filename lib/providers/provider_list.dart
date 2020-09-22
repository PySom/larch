import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'app_data_provider.dart';
import 'auth_provider.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider<Auth>(create: (_) => Auth()),
  Provider<AppData>(
    create: (_) => AppData(),
  ),
];
