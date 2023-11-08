// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'borrowed_tools_bloc.dart';

@JsonSerializable()
class BorrowedToolsState extends Equatable {
  final List<BorrowedTools> borrowed;
  const BorrowedToolsState({
    this.borrowed = const [],
  });
  @override
  List<Object?> get props => [
        borrowed,
      ];
}
