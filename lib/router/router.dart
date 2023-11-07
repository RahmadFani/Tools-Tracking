import 'package:go_router/go_router.dart';
import 'package:tools_tracking/router/routes.dart';

class MyRouter {
  static GoRouter init() => GoRouter(
        initialLocation: SplashRoute().location,
        routes: $appRoutes,
        navigatorKey: rootNavigatorKey,
      );
}
