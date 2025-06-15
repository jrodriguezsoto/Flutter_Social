import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String profilePictureUrl;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePictureUrl,
  });

  factory User.fromJson(Map<String, dynamic> map) => _$UserFromJson(map);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [id, name, email, profilePictureUrl];
}
