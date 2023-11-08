part of '../tools.dart';

class ToolsPage extends StatelessWidget {
  const ToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<BorrowedToolsBloc>.value(
            value: getIt<BorrowedToolsBloc>(),
          ),
        ],
        child: BlocProvider(
          create: (context) => ToolsBloc(),
          child: const ToolsView(),
        ),
      ),
    );
  }
}

class ToolsView extends StatelessWidget {
  const ToolsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToolsBloc, ToolsState>(
      builder: (context, state) {
        return SafeArea(
          child: SizedBox.expand(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Peralatan',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  itemBuilder: (context, index) =>
                      _ToolCard(state.tools[index]),
                  itemCount: state.tools.length,
                ))
              ],
            ),
          ),
        );
      },
    );
  }
}
