part of 'tools_bloc.dart';

class ToolsState extends Equatable {
  final List<Tools> tools;

  const ToolsState({
    required this.tools,
  });

  @override
  List<Object?> get props => [tools];
}
