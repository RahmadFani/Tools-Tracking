part of 'friends_bloc.dart';

class FriendsEvent {}

class AddFriend extends FriendsEvent {
  final Friends friends;

  AddFriend({required this.friends});
}
