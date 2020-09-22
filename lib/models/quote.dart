import 'package:hive/hive.dart';

part 'quote.g.dart';

@HiveType(typeId: 8)
class Quote {
  @HiveField(0)
  int id;
  @HiveField(1)
  String content;
  @HiveField(2)
  String showOn;

  Quote({this.id, this.content, this.showOn});

  Quote.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    showOn = json['showOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['showOn'] = this.showOn;
    return data;
  }
}
