// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrowed_tools.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorrowedTools _$BorrowedToolsFromJson(Map<String, dynamic> json) =>
    BorrowedTools(
      userId: json['userId'] as String,
      toolId: json['toolId'] as String,
      borrowedCount: json['borrowedCount'] as int,
    );

Map<String, dynamic> _$BorrowedToolsToJson(BorrowedTools instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'toolId': instance.toolId,
      'borrowedCount': instance.borrowedCount,
    };
