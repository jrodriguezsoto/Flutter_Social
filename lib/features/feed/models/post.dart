import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class PostModel extends Equatable {
  final String id;
  final String content;
  final String authorId;
  final DateTime createdAt;

  const PostModel({
    required this.id,
    required this.content,
    required this.authorId,
    required this.createdAt,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostModelToJson(this);

  @override
  List<Object?> get props => [id, content, authorId, createdAt];
}
