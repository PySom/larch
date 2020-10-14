import 'package:hive/hive.dart';

part 'prayer.g.dart';

@HiveType(typeId: 11)
class Prayer {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String content;
  @HiveField(3)
  int prayerCategoryId;

  Prayer({this.id, this.title, this.content, this.prayerCategoryId});

  Prayer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    prayerCategoryId = json['prayerCategoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['prayerCategoryId'] = this.prayerCategoryId;
    return data;
  }
}
