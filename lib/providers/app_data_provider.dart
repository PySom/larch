import 'package:flutter/widgets.dart';
import 'package:lagosarchdiocese/Exceptions/api_failure_exception.dart';
import 'package:lagosarchdiocese/models/app_model.dart';
import 'package:lagosarchdiocese/models/deanery.dart';
import 'package:lagosarchdiocese/models/donation.dart';
import 'package:lagosarchdiocese/models/news.dart';
import 'package:lagosarchdiocese/models/occasion.dart';
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
  List<Reflection> _reflections;
  AppModel _appModel;

  NetworkHelper _helper = NetworkHelper();
  HiveRepository _hiveRepository = HiveRepository();

  List<News> get news => _news;

  void setLastRoute(String route) {
    setAppModel(AppModel(
        lastRoute: route,
        token: _appModel?.token,
        isFirstTime: _appModel?.isFirstTime));
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
      //_persistDeaneries(data);
      return _donations;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<List<Deanery>> getDeaneries() async {
    if (_deaneries != null) return _deaneries;
    return await refreshDeaneries();
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

  Future<List<Reflection>> getReflections() async {
    if (_reflections != null) return _reflections;
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

  // Future<List<Event>> getEvents() async {
  //   if (_reflections != null) return _reflections;
  //   return await refreshReflections();
  // }
  //
  // Future<List<Reflection>> refresEvents() async {
  //   try {
  //     var data = await _helper.getRequest('$kAppAPIUrl/reflections');
  //     _reflections =
  //         (data as List).map((datum) => Reflection.fromJson(datum)).toList();
  //     _persistItem<List<Reflection>>(_reflections, kReflection);
  //     //_persistDeaneries(data);
  //     return _reflections;
  //   } catch (ex) {
  //     throw ApiFailureException(ex);
  //   }
  // }

  Future<List<News>> getNews() async {
    if (_news != null) return _news;
    return await refreshNews();
  }

  Future<List<News>> refreshNews() async {
    try {
      var data = await _helper.getRequest('$kAppAPIUrl/news');
      _news = (data as List).map((datum) => News.fromJson(datum)).toList();
      _persistItem<List<Deanery>>(_deaneries, kDeanery);
      //_persistDeaneries(data);
      return _news;
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<void> _persistItem<T>(T data, String name) async {
    await _hiveRepository.open(name);
    _hiveRepository.add<T>(name: name, key: name, item: data);
  }
}
