import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:tools_tracking/persentation/tools/models/tools.dart';

part 'tools_state.dart';
part 'tools_event.dart';

///
/// ##### Whats this bloc function ?
///
/// read this [ToolsEvent]
///
class ToolsBloc extends Bloc<ToolsEvent, ToolsState> {
  ToolsBloc()
      : super(
          ToolsState(tools: Tools.jokoTools),
        );
}
