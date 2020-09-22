import 'package:hive/hive.dart';

part 'donation.g.dart';

@HiveType(typeId: 4)
class Donation {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String content;
  @HiveField(3)
  String image;
  @HiveField(4)
  String video;

  Donation({this.id, this.title, this.content, this.image, this.video});

  Donation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['image'] = this.image;
    data['video'] = this.video;
    return data;
  }
}
