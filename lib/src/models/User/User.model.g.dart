// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as String,
    name: json['name'] as String,
    username: json['username'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
    website: json['website'] as String,
    address: json['address'] == null
        ? null
        : Address.json(json['address'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'website': instance.website,
      'address': instance.address,
    };
