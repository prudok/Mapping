// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      email: json['email'] as String,
      name: json['name'] as String,
      surName: json['surName'] as String,
      goalOfTheWeek: json['goalOfTheWeek'] as int? ?? 0,
      routes: (json['routes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'surName': instance.surName,
      'goalOfTheWeek': instance.goalOfTheWeek,
      'routes': instance.routes,
    };
