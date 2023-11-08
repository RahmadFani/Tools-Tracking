import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
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

  static List<Friends> jokoFriends = [
    Friends(name: 'Joni', uid: const Uuid().v4()),
    Friends(name: 'Sentosa', uid: const Uuid().v4()),
    Friends(name: 'Siti', uid: const Uuid().v4()),
    Friends(name: 'Sari', uid: const Uuid().v4()),
    Friends(name: 'Bagas', uid: const Uuid().v4()),
  ];
}
