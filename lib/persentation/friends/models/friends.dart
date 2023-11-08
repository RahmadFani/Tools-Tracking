import 'package:json_annotation/json_annotation.dart';
part 'friends.g.dart';

@JsonSerializable()
class Friends {
  final String name;
  final String uid;

  Friends({
    required this.name,
    required this.uid,
  });

  String get uniqueName => name.toLowerCase().replaceAll(' ', '_');

  factory Friends.fromJson(Map<String, dynamic> json) =>
      _$FriendsFromJson(json);

  Map<String, dynamic> toJson() => _$FriendsToJson(this);
}
