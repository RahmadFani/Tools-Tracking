import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools_tracking/persentation/borrowed_tools/models/borrowed_tools.dart';

part 'borrowed_tools_state.dart';
part 'borrowed_tools_event.dart';
part 'borrowed_tools_bloc.g.dart';

class BorrowedToolsBloc
    extends HydratedBloc<BorrowedToolsEvent, BorrowedToolsState> {
  BorrowedToolsBloc() : super(const BorrowedToolsState()) {
    on<BorrowedToolsEvent>((event, emit) {});
  }

  @override
  BorrowedToolsState? fromJson(Map<String, dynamic> json) {
    return _$BorrowedToolsStateFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(BorrowedToolsState state) {
    return _$BorrowedToolsStateToJson(state);
  }
}
