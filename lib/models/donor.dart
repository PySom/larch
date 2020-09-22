import 'package:hive/hive.dart';
import 'package:lagosarchdiocese/models/user_model.dart';

import 'donation.dart';

part 'donor.g.dart';

@HiveType(typeId: 5)
class Donor {
  @HiveField(0)
  int id;
  @HiveField(1)
  String dateDonated;
  @HiveField(2)
  int amount;
  @HiveField(3)
  User user;
  @HiveField(4)
  Donation donation;

  Donor({this.id, this.dateDonated, this.amount, this.user, this.donation});

  Donor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateDonated = json['dateDonated'];
    amount = json['amount'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    donation = json['donation'] != null
        ? new Donation.fromJson(json['donation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateDonated'] = this.dateDonated;
    data['amount'] = this.amount;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.donation != null) {
      data['donation'] = this.donation.toJson();
    }
    return data;
  }
}
