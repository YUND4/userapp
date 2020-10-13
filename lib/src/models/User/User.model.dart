import 'package:json_annotation/json_annotation.dart';
import 'package:userapp/src/models/Address/Address.model.dart';

part 'User.model.g.dart';

@JsonSerializable()
class User {
  String id;
  String name;
  String username;
  String email;
  String phone;
  String website;
  Address address;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.website,
    this.address,
  });

  factory User.json(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
