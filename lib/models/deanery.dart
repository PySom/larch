import 'package:hive/hive.dart';
import 'package:lagosarchdiocese/models/parish.dart';

part 'deanery.g.dart';

@HiveType(typeId: 10)
class Deanery {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String other;
  @HiveField(3)
  List<Parish> parishes;

  Deanery({this.parishes, this.id, this.name, this.other});

  Deanery.fromJson(Map<String, dynamic> json) {
    if (json['parishes'] != null) {
      parishes = new List<Parish>();
      json['parishes'].forEach((v) {
        parishes.add(Parish.fromJson(v));
      });
    }
    id = json['id'];
    name = json['name'];
    other = json['other'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.parishes != null) {
      data['parishes'] = this.parishes.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    data['other'] = this.other;
    return data;
  }
}
