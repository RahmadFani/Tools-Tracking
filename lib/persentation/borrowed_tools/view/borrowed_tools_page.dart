part of '../borrowed_tools.dart';

///
/// #### Noted:
///
/// IF Joko's tools is dynamic should use Tools bloc state instead model [Tools.jokoTools]
class BorrowedToolsPage extends StatelessWidget {
  const BorrowedToolsPage({
    super.key,
    required this.toolsId,
  });

  final String toolsId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BorrowedToolsBloc>.value(
          value: getIt<BorrowedToolsBloc>(),
        ),
        BlocProvider<FriendsBloc>.value(
          value: getIt<FriendsBloc>(),
        )
      ],
      child: Container(
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: BorrowedToolsView(
          tool: Tools.jokoTools
              .where((element) => element.idUnique == toolsId)
              .toList()
              .first,
        ),
      ),
    );
  }
}

class BorrowedToolsView extends StatelessWidget {
  const BorrowedToolsView({super.key, required this.tool});

  final Tools tool;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text('Pinjamkan Alat'),
          ),
          _BorrowedToolsHeader(
            tool: tool,
          ),
          const Divider(
            height: 1,
          ),
          _BorrowedToolsBorrowTo(
            tool: tool,
          ),
          const Divider(
            height: 1,
          ),
          _BorrowedToolsForm(
            tool: tool,
          )
        ],
      ),
    );
  }
}
