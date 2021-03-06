import 'package:flutter/widgets.dart';
import 'package:lagosarchdiocese/Exceptions/api_failure_exception.dart';
import 'package:lagosarchdiocese/models/app_model.dart';
import 'package:lagosarchdiocese/models/deanery.dart';
import 'package:lagosarchdiocese/models/donation.dart';
import 'package:lagosarchdiocese/models/news.dart';
import 'package:lagosarchdiocese/models/occasion.dart';
import 'package:lagosarchdiocese/models/prayer_category.dart';
import 'package:lagosarchdiocese/models/quote.dart';
import 'package:lagosarchdiocese/models/reflection.dart';
import 'package:lagosarchdiocese/repository/hive_repository.dart';
import 'package:lagosarchdiocese/services/network_helper.dart';
import 'package:lagosarchdiocese/utils/constants.dart';
import 'package:provider/provider.dart';

class AppData {
  List<Deanery> _deaneries;
  List<Donation> _donations;
  List<News> _news;
  List<Occasion> _occasions;
  List<Quote> _quotes;
  List<PrayerCategory> _prayerCategory;
  List<Reflection> _reflections;
  AppModel _appModel;

  NetworkHelper _helper = NetworkHelper();
  HiveRepository _hiveRepository = HiveRepository();

  List<News> get news => _news;

  void setLastRoute(String route) {
    if (_appModel?.lastRoute != route ?? true) {
      setAppModel(AppModel(
          lastRoute: route,
          token: _appModel?.token,
          isFirstTime: _appModel?.isFirstTime));
    }
  }

  AppModel get appModel => _appModel;
  void setAppModel(AppModel model) {
    _appModel = model;
    _hiveRepository.add(item: model, name: kAppDataName, key: kAppDataName);
  }

  static AppData appDataProvider(BuildContext context, {bool listen = false}) =>
      Provider.of<AppData>(context, listen: listen);

  Future<List<Donation>> getDonations() async {
    return await refreshDonations();
  }

  Future<List<Donation>> refreshDonations() async {
    try {
      var data = await _helper.getRequest('$kAppAPIUrl/donations');
      _donations =
          (data as List).map((datum) => Donation.fromJson(datum)).toList();
      _persistItem<List<Donation>>(_donations, kDonation);
      return _donations;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<List<Deanery>> getDeaneries() async {
    if (_deaneries != null) return _deaneries;
    List<Deanery> items =
        await _getFromHive<Deanery, List<Deanery>>(kDeanery, kDeanery);
    if (items == null) {
      return await refreshDeaneries();
    } else {
      _deaneries = items;
      return items;
    }
  }

  Future<List<Deanery>> refreshDeaneries() async {
    try {
      var data = await _helper.getRequest('$kAppAPIUrl/deaneries');
      _deaneries =
          (data as List).map((datum) => Deanery.fromJson(datum)).toList();
      _persistItem<List<Deanery>>(_deaneries, kDeanery);
      //_persistDeaneries(data);
      return _deaneries;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<List<PrayerCategory>> getPrayers() async {
    if (_prayerCategory != null) return _prayerCategory;
    List<PrayerCategory> items =
        await _getFromHive<PrayerCategory, List<PrayerCategory>>(
            kPrayer, kPrayer);
    if (items == null) {
      return await refreshPrayers();
    } else {
      _prayerCategory = items;
      return items;
    }
  }

  Future<List<PrayerCategory>> refreshPrayers() async {
    try {
      print('trying');
      var data =
          await _helper.getRequest('$kAppAPIUrl/prayercategories/includechild');
      _prayerCategory = (data as List)
          .map((datum) => PrayerCategory.fromJson(datum))
          .toList();
      _persistItem<List<PrayerCategory>>(_prayerCategory, kPrayer);
      return _prayerCategory;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<List<Reflection>> getReflections() async {
    if (_reflections != null) return _reflections;
    List<Reflection> items = await _getFromHive<Reflection, List<Reflection>>(
        kReflection, kReflection);
    if (items != null) {
      _reflections = items;
      return items;
    }
    return await refreshReflections();
  }

  Future<List<Reflection>> refreshReflections() async {
    try {
      var data = await _helper.getRequest('$kAppAPIUrl/reflections');
      _reflections =
          (data as List).map((datum) => Reflection.fromJson(datum)).toList();
      _persistItem<List<Reflection>>(_reflections, kReflection);
      //_persistDeaneries(data);
      return _reflections;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<List<Occasion>> getEvents() async {
    if (_occasions != null) return _occasions;
    List<Occasion> items =
        await _getFromHive<Occasion, List<Occasion>>(kOccasion, kOccasion);
    if (items != null) {
      _occasions = items;
      return items;
    }
    return await refreshEvents();
  }

  Future<List<Occasion>> refreshEvents() async {
    try {
      var data = await _helper.getRequest('$kAppAPIUrl/occasions');
      _occasions =
          (data as List).map((datum) => Occasion.fromJson(datum)).toList();
      _persistItem<List<Occasion>>(_occasions, kOccasion);
      //_persistDeaneries(data);
      return _occasions;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<News> getNewsWithId(int id) async {
    try {
      var data = await _helper.getRequest('$kAppAPIUrl/news/$id');
      return News.fromJson(data);
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<List<News>> getNews() async {
    if (_news != null) return _news;
    List<News> items = await _getFromHive<News, List<News>>(kNews, kNews);
    print(items);
    print(items.runtimeType);
    if (items != null) {
      _news = items;
      return items;
    }
    return await refreshNews();
  }

  Future<List<News>> refreshNews() async {
    try {
      var data = await _helper.getRequest('$kAppAPIUrl/news');
      _news = (data as List).map((datum) => News.fromJson(datum)).toList();
      _persistItem<List<News>>(_news, kNews);
      return _news;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<void> _persistItem<T>(T data, String name) async {
    await _hiveRepository.open(name);
    _hiveRepository.add<T>(name: name, key: name, item: data);
  }

  Future<TR> _getFromHive<T, TR>(String key, String name) async {
    await _hiveRepository.open(key);
    var item = _hiveRepository.get(key: key, name: name);
    return item?.cast<T>()?.toList() ?? null;
  }
}
