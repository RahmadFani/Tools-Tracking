// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'borrowed_tools_bloc.dart';

class BorrowedToolsEvent {}

class BorrowToNewUser extends BorrowedToolsEvent {
  final String toolsId;
  final String userName;
  BorrowToNewUser({
    required this.toolsId,
    required this.userName,
  });
}

class BorrowToUser extends BorrowedToolsEvent {
  final String toolsId;
  final String userId;
  BorrowToUser({
    required this.toolsId,
    required this.userId,
  });
}

class ReturnedTools extends BorrowedToolsEvent {
  final String toolsId;
  final String userId;
  ReturnedTools({
    required this.toolsId,
    required this.userId,
  });
}
