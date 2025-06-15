// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
  userId: json['userId'] as String,
  friendsIds: (json['friendsIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  posts: (json['posts'] as List<dynamic>)
      .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'friendsIds': instance.friendsIds,
      'posts': instance.posts,
    };
