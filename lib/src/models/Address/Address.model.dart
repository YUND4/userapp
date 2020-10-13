import 'package:json_annotation/json_annotation.dart';

import '../Geo/Geo.model.dart';

part 'Address.model.g.dart';

@JsonSerializable()
class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  factory Address.json(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
