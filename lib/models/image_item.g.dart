// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageItemImpl _$$ImageItemImplFromJson(Map<String, dynamic> json) =>
    _$ImageItemImpl(
      previewURL: json['previewURL'] as String,
      likes: (json['likes'] as num).toInt(),
      views: (json['views'] as num).toInt(),
    );

Map<String, dynamic> _$$ImageItemImplToJson(_$ImageItemImpl instance) =>
    <String, dynamic>{
      'previewURL': instance.previewURL,
      'likes': instance.likes,
      'views': instance.views,
    };
