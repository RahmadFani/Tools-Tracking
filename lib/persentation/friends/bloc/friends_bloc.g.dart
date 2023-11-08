// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendsState _$FriendsStateFromJson(Map<String, dynamic> json) => FriendsState(
      friends: (json['friends'] as List<dynamic>?)
              ?.map((e) => Friends.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$FriendsStateToJson(FriendsState instance) =>
    <String, dynamic>{
      'friends': instance.friends,
    };
