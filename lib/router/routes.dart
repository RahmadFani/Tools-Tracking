import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tools_tracking/persentation/app/app.dart';
import 'package:tools_tracking/persentation/borrowed_tools/borrowed_tools.dart';

import 'package:tools_tracking/persentation/splash/splash.dart';
import 'package:tools_tracking/persentation/tools/tools.dart';

part 'routes.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

@TypedShellRoute<AppRoute>(
  routes: [
    TypedGoRoute<ToolsRoute>(
      path: '/tools',
      routes: [
        TypedGoRoute<BorrowedToolsRoute>(path: 'borrowed'),
      ],
    ),
  ],
)
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

class ToolsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ToolsPage();
  }
}

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}

class BorrowedToolsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BorrowedToolsPage();
  }
}
