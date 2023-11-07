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
          Animate().toggle(
            duration: 600.ms,
            builder: (_, value, __) => AnimatedContainer(
              duration: 600.ms,
              height: value ? 0 : 40,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: const Text(
                  'Tools Tracking',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ).animate(
                  onComplete: (controller) async {
                    await Future.delayed(500.milliseconds);
                    if (context.mounted) {
                      HomeRoute().go(context);
                    }
                  },
                ).fadeIn(
                  delay: 700.milliseconds,
                  duration: 600.milliseconds,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
