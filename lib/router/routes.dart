import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tools_tracking/persentation/app/app.dart';
import 'package:tools_tracking/persentation/home/home.dart';
import 'package:tools_tracking/persentation/splash/splash.dart';

part 'routes.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

@TypedShellRoute<AppRoute>(routes: [
  TypedGoRoute<HomeRoute>(path: '/home'),
])
class AppRoute extends ShellRouteData {
  const AppRoute();

  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Page<void> pageBuilder(
      BuildContext context, GoRouterState state, Widget navigator) {
    return CustomTransitionPage(
      child: AppShellView(child: navigator),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}

class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}
