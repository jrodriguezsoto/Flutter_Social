import 'package:equatable/equatable.dart';
import 'package:flutter_social/features/feed/models/post.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class ProfileModel extends Equatable {
  final String userId;
  final List<String> friendsIds;
  final List<PostModel> posts;

  const ProfileModel({
    required this.userId,
    required this.friendsIds,
    required this.posts,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);

  @override
  List<Object?> get props => throw UnimplementedError();
}
