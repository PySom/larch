import 'package:hive/hive.dart';
import 'package:lagosarchdiocese/models/prayer.dart';

part 'prayer_category.g.dart';

@HiveType(typeId: 12)
class PrayerCategory {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  List<Prayer> prayers;

  PrayerCategory({this.id, this.title, this.prayers});

  PrayerCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['prayers'] != null) {
      prayers = List<Prayer>();
      json['prayers'].forEach((v) {
        prayers.add(Prayer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.prayers != null) {
      data['prayers'] = this.prayers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
