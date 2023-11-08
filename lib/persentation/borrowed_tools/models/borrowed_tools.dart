import 'package:json_annotation/json_annotation.dart';

part 'borrowed_tools.g.dart';

@JsonSerializable()
class BorrowedTools {
  final String userId;
  final String toolId;
  final int borrowedCount;

  BorrowedTools({
    required this.userId,
    required this.toolId,
    required this.borrowedCount,
  });

  factory BorrowedTools.fromJson(Map<String, dynamic> json) =>
      _$BorrowedToolsFromJson(json);

  Map<String, dynamic> toJson() => _$BorrowedToolsToJson(this);
}
