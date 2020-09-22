import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  String id;
  @HiveField(1)
  String surName;
  @HiveField(2)
  String firstName;
  @HiveField(3)
  String phoneNumber;
  @HiveField(4)
  String email;
  @HiveField(5)
  String image;
  @HiveField(6)
  bool isAdmin;
  @HiveField(7)
  String token;

  User(
      {this.id,
      this.surName,
      this.firstName,
      this.phoneNumber,
      this.email,
      this.image,
      this.isAdmin,
      this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    surName = json['surName'];
    firstName = json['firstName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    image = json['image'];
    isAdmin = json['isAdmin'];
    token = json['token'];
  }

  String get fullName {
    if (this == null) return null;
    String name;
    if (this.firstName != null) {
      if (this.surName != null) {
        name = '${this.firstName} ${this.surName}';
      } else {
        name = this.firstName;
      }
    } else if (this.surName != null) {
      name = this.surName;
    }
    return name;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['surName'] = this.surName;
    data['firstName'] = this.firstName;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['image'] = this.image;
    data['isAdmin'] = this.isAdmin;
    data['token'] = this.token;
    return data;
  }
}
