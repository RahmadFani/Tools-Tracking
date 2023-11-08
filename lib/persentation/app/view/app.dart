part of '../app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tools Tracking',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      routerConfig: getIt<GoRouter>(),
    );
  }
}

class AppShellView extends StatelessWidget {
  const AppShellView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    final showNavigation = location.split('/').length == 2 &&
            (location.startsWith('/tools') || location.startsWith('/friends'))
        ? true
        : false;
    return Scaffold(
      body: child,
      bottomNavigationBar: showNavigation
          ? NavigationBar(
              selectedIndex: location.startsWith('/tools') ? 0 : 1,
              onDestinationSelected: (value) {
                if (value == 0) {
                  ToolsRoute().go(context);
                } else {
                  FriendsRoute().go(context);
                }
              },
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.toll_outlined),
                  label: 'Alat',
                ),
                NavigationDestination(
                  icon: Icon(Icons.supervised_user_circle_outlined),
                  label: 'Teman',
                ),
              ],
            )
          : null,
    );
  }
}
