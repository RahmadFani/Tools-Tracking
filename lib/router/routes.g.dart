// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $appRoute,
      $splashRoute,
    ];

RouteBase get $appRoute => ShellRouteData.$route(
      navigatorKey: AppRoute.$navigatorKey,
      factory: $AppRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/tools',
          factory: $ToolsRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'borrowed',
              factory: $BorrowedToolsRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $AppRouteExtension on AppRoute {
  static AppRoute _fromState(GoRouterState state) => const AppRoute();
}

extension $ToolsRouteExtension on ToolsRoute {
  static ToolsRoute _fromState(GoRouterState state) => ToolsRoute();

  String get location => GoRouteData.$location(
        '/tools',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BorrowedToolsRouteExtension on BorrowedToolsRoute {
  static BorrowedToolsRoute _fromState(GoRouterState state) =>
      BorrowedToolsRoute();

  String get location => GoRouteData.$location(
        '/tools/borrowed',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $splashRoute => GoRouteData.$route(
      path: '/splash',
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => SplashRoute();

  String get location => GoRouteData.$location(
        '/splash',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
