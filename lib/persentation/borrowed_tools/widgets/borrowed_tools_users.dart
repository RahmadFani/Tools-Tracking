part of '../borrowed_tools.dart';

class _BorrowedToolsUsers extends StatelessWidget {
  const _BorrowedToolsUsers({required this.tool});

  final Tools tool;

  static Route open(Tools tool) =>
      MaterialPageRoute(builder: (context) => _BorrowedToolsUsers(tool: tool));

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      key: const Key('_BorrowedToolsUsers'),
      providers: [
        BlocProvider<BorrowedToolsBloc>.value(
          value: getIt<BorrowedToolsBloc>(),
        ),
        BlocProvider<FriendsBloc>.value(
          value: getIt<FriendsBloc>(),
        )
      ],
      child: BlocBuilder<BorrowedToolsBloc, BorrowedToolsState>(
        builder: (context, borrowState) {
          final borrowed = borrowState.borrowed
              .where((element) => element.toolId == tool.idUnique)
              .toList();
          return BlocBuilder<FriendsBloc, FriendsState>(
            builder: (context, friendsState) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  title: Text(
                      '${tool.title} (${borrowed.map((e) => e.borrowedCount).sum})'),
                ),
                body: ListView.builder(
                  itemBuilder: (context, index) {
                    final borrow = borrowed[index];
                    final person = friendsState.friends
                        .where(
                          (element) => element.uid == borrow.userId,
                        )
                        .first;
                    return ListTile(
                      title: Text(person.name),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('${borrow.borrowedCount} Item'),
                          TextButton(
                            onPressed: () {
                              context.read<BorrowedToolsBloc>().add(
                                    ReturnedTools(
                                        toolsId: tool.idUnique,
                                        userId: person.uid),
                                  );
                            },
                            child: const Text('Bailikin'),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: borrowed.length,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
