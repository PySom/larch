import 'package:hive/hive.dart';

part 'news.g.dart';

@HiveType(typeId: 3)
class News {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String brief;
  @HiveField(3)
  String content;
  @HiveField(4)
  String datePosted;
  @HiveField(5)
  String image;

  News(
      {this.id,
      this.title,
      this.brief,
      this.content,
      this.datePosted,
      this.image});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    brief = json['brief'];
    content = json['content'];
    datePosted = json['datePosted'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['brief'] = this.brief;
    data['content'] = this.content;
    data['datePosted'] = this.datePosted;
    data['image'] = this.image;
    return data;
  }
}
