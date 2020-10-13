import 'package:json_annotation/json_annotation.dart';

part 'Geo.model.g.dart';

@JsonSerializable()
class Geo {
  double lat;
  double lng;

  Geo({this.lat, this.lng});

  factory Geo.json(Map<String, dynamic> json) => _$GeoFromJson(json);
  Map<String, dynamic> toJson() => _$GeoToJson(this);
}
