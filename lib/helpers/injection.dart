import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:tools_tracking/router/router.dart';

GetIt getIt = GetIt.I;

class Injection {
  static void init() {
    getIt.registerLazySingleton<GoRouter>(() => MyRouter.init());
  }
}
