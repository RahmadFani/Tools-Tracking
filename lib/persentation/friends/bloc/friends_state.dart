// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'friends_bloc.dart';

@JsonSerializable()
class FriendsState extends Equatable {
  final List<Friends> friends;
  const FriendsState({
    this.friends = const [],
  });
  @override
  List<Object?> get props => [friends];

  FriendsState copyWith({
    List<Friends>? friends,
  }) {
    return FriendsState(
      friends: friends ?? this.friends,
    );
  }
}
