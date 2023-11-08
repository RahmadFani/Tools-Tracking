part of '../splash.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashView());
  }
}

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/icons/tools.png')
              .animate()
              .scale(duration: 400.milliseconds),
          const Text(
            'Tools Tracking',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ).animate(
            onComplete: (controller) async {
              await Future.delayed(500.milliseconds);
              if (context.mounted) {
                ToolsRoute().go(context);
              }
            },
          ).fadeIn(
            delay: 700.milliseconds,
            duration: 600.milliseconds,
          ),
        ],
      ),
    );
  }
}
