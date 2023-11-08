part of '../friend_loan.dart';

class FriendLoanPage extends StatelessWidget {
  const FriendLoanPage({
    super.key,
    required this.userUid,
  });

  final String userUid;

  @override
  Widget build(BuildContext context) {
    final friend = getIt<FriendsBloc>()
        .state
        .friends
        .where((element) => element.uid == userUid)
        .first;
    return MultiBlocProvider(
      providers: [
        BlocProvider<BorrowedToolsBloc>.value(
          value: getIt<BorrowedToolsBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(friend.name),
        ),
        body: FriendLoanView(
          friend: friend,
        ),
      ),
    );
  }
}

class FriendLoanView extends StatelessWidget {
  const FriendLoanView({
    super.key,
    required this.friend,
  });

  final Friends friend;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BorrowedToolsBloc, BorrowedToolsState>(
      builder: (context, borrowedState) {
        final borrow = borrowedState.borrowed
            .where((element) => element.userId == friend.uid)
            .toList();
        if (borrow.isEmpty) {
          return const Center(
            child: Text('Belum ada barang dipinjam'),
          );
        }
        return ListView.separated(
            itemBuilder: (context, index) {
              final data = borrow[index];
              final tools = Tools.jokoTools
                  .where((element) => element.idUnique == data.toolId)
                  .first;
              return ListTile(
                leading: Image.asset(
                  tools.assets,
                  width: 40,
                  height: 40,
                ),
                title: Text(tools.title),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${data.borrowedCount} Item'),
                    TextButton(
                      onPressed: () {
                        context.read<BorrowedToolsBloc>().add(
                              ReturnedTools(
                                  toolsId: tools.idUnique, userId: friend.uid),
                            );
                      },
                      child: const Text('Bailikin'),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(
                  height: 1,
                ),
            itemCount: borrow.length);
      },
    );
  }
}
