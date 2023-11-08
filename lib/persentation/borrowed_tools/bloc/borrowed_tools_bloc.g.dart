// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrowed_tools_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorrowedToolsState _$BorrowedToolsStateFromJson(Map<String, dynamic> json) =>
    BorrowedToolsState(
      borrowed: (json['borrowed'] as List<dynamic>?)
              ?.map((e) => BorrowedTools.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BorrowedToolsStateToJson(BorrowedToolsState instance) =>
    <String, dynamic>{
      'borrowed': instance.borrowed,
    };
