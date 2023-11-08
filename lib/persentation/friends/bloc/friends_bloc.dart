import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools_tracking/persentation/friends/models/friends.dart';

part 'friends_state.dart';
part 'friends_event.dart';
part 'friends_bloc.g.dart';

class FriendsBloc extends HydratedBloc<FriendsEvent, FriendsState> {
  FriendsBloc() : super(const FriendsState()) {
    on<AddFriend>((event, emit) {});
  }

  @override
  FriendsState? fromJson(Map<String, dynamic> json) {
    return _$FriendsStateFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(FriendsState state) {
    return _$FriendsStateToJson(state);
  }
}
