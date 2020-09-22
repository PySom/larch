import 'package:hive/hive.dart';

part 'parish.g.dart';

@HiveType(typeId: 7)
class Parish {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String image;
  @HiveField(3)
  double longitude;
  @HiveField(4)
  double latitude;
  @HiveField(5)
  String mapUrl;
  @HiveField(6)
  String address;
  @HiveField(7)
  String email;
  @HiveField(8)
  String phone;
  @HiveField(9)
  String parishPriest;
  @HiveField(10)
  int totalPriests;
  @HiveField(11)
  int deaneryId;
  @HiveField(12)
  String massDetail;
  @HiveField(13)
  String confessionDetail;

  Parish(
      {this.id,
      this.name,
      this.image,
      this.longitude,
      this.latitude,
      this.mapUrl,
      this.address,
      this.email,
      this.phone,
      this.parishPriest,
      this.totalPriests,
      this.confessionDetail,
      this.massDetail,
      this.deaneryId});

  Parish.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    mapUrl = json['mapUrl'];
    address = json['address'];
    email = json['email'];
    phone = json['phone'];
    parishPriest = json['parishPriest'];
    totalPriests = json['totalPriests'];
    deaneryId = json['deaneryId'];
    confessionDetail = json['confessionDetail'];
    massDetail = json['massDetail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['mapUrl'] = this.mapUrl;
    data['address'] = this.address;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['parishPriest'] = this.parishPriest;
    data['totalPriests'] = this.totalPriests;
    data['deaneryId'] = this.deaneryId;
    data['confessionDetail'] = this.confessionDetail;
    data['massDetail'] = this.massDetail;
    return data;
  }
}
