// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Dialog _$$_DialogFromJson(Map<String, dynamic> json) => _$_Dialog(
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DialogToJson(_$_Dialog instance) => <String, dynamic>{
      'messages': instance.messages,
    };
