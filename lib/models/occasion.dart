import 'package:hive/hive.dart';

part 'occasion.g.dart';

@HiveType(typeId: 6)
class Occasion {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String brief;
  @HiveField(3)
  String content;
  @HiveField(4)
  String image;
  @HiveField(5)
  String startDate;
  @HiveField(6)
  String endDate;
  @HiveField(7)
  String datePosted;

  Occasion(
      {this.id,
      this.title,
      this.brief,
      this.content,
      this.image,
      this.startDate,
      this.endDate,
      this.datePosted});

  Occasion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    brief = json['brief'];
    content = json['content'];
    image = json['image'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    datePosted = json['datePosted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['brief'] = this.brief;
    data['content'] = this.content;
    data['image'] = this.image;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['datePosted'] = this.datePosted;
    return data;
  }
}
