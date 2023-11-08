import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools_tracking/helpers/injection.dart';
import 'package:tools_tracking/persentation/borrowed_tools/models/borrowed_tools.dart';
import 'package:tools_tracking/persentation/friends/bloc/friends_bloc.dart';
import 'package:tools_tracking/persentation/friends/models/friends.dart';
import 'package:uuid/uuid.dart';

part 'borrowed_tools_state.dart';
part 'borrowed_tools_event.dart';
part 'borrowed_tools_bloc.g.dart';

class BorrowedToolsBloc
    extends HydratedBloc<BorrowedToolsEvent, BorrowedToolsState> {
  BorrowedToolsBloc() : super(const BorrowedToolsState()) {
    on<BorrowToNewUser>(_onBorrowToNewUser);
    on<BorrowToUser>(_onBorrowToUser);
    on<ReturnedTools>(_onReturnedTools);
  }

  FriendsBloc friendsBloc = getIt<FriendsBloc>();

  @override
  BorrowedToolsState? fromJson(Map<String, dynamic> json) {
    return _$BorrowedToolsStateFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(BorrowedToolsState state) {
    return _$BorrowedToolsStateToJson(state);
  }

  FutureOr<void> _onBorrowToNewUser(
      BorrowToNewUser event, Emitter<BorrowedToolsState> emit) {
    final friends = Friends(name: event.userName, uid: const Uuid().v4());
    friendsBloc.add(AddFriend(friends: friends));
    emit(
      state.copyWith(
        borrowed: [
          ...state.borrowed,
          BorrowedTools(
              userId: friends.uid, toolId: event.toolsId, borrowedCount: 1)
        ],
      ),
    );
  }

  FutureOr<void> _onBorrowToUser(
      BorrowToUser event, Emitter<BorrowedToolsState> emit) {
    final borrowed = state.borrowed.where((element) =>
        element.toolId == event.toolsId && element.userId == event.userId);

    if (borrowed.isEmpty) {
      emit(state.copyWith(borrowed: [
        ...state.borrowed,
        BorrowedTools(
            userId: event.userId, toolId: event.toolsId, borrowedCount: 1)
      ]));
    } else {
      final listBorrowed = List<BorrowedTools>.from(state.borrowed);
      var borrowedNew = listBorrowed
          .where((element) =>
              element.toolId == event.toolsId && element.userId == event.userId)
          .first;
      emit(
        state.copyWith(
          borrowed: [
            ...state.borrowed..remove(borrowedNew),
            BorrowedTools(
                userId: borrowedNew.userId,
                toolId: borrowedNew.toolId,
                borrowedCount: borrowedNew.borrowedCount + 1)
          ],
        ),
      );
    }
  }

  FutureOr<void> _onReturnedTools(
      ReturnedTools event, Emitter<BorrowedToolsState> emit) {
    final listBorrowed = List<BorrowedTools>.from(state.borrowed);
    var borrowedNew = listBorrowed
        .where((element) =>
            element.toolId == event.toolsId && element.userId == event.userId)
        .first;
    emit(
      state.copyWith(
        borrowed: [
          ...listBorrowed..remove(borrowedNew),
        ],
      ),
    );
  }
}
