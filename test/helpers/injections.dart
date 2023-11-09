import 'package:bloc_test/bloc_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:tools_tracking/persentation/borrowed_tools/bloc/borrowed_tools_bloc.dart';
import 'package:tools_tracking/persentation/friends/bloc/friends_bloc.dart';

import 'package:tools_tracking/router/router.dart';

class MockBorrowedToolsBloc
    extends MockBloc<BorrowedToolsEvent, BorrowedToolsState>
    implements BorrowedToolsBloc {}

class MockFriendsBloc extends MockBloc<FriendsEvent, FriendsState>
    implements FriendsBloc {}

GetIt getIt = GetIt.I;
void injectionUnit() {
  // inject Router
  final router = MyRouter.init();
  getIt.registerLazySingleton<GoRouter>(() => router);

  // inject mock bloc
  getIt.registerLazySingleton<BorrowedToolsBloc>(() => MockBorrowedToolsBloc());
  getIt.registerLazySingleton<FriendsBloc>(() => MockFriendsBloc());
}
