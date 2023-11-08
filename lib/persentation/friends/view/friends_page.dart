part of '../friends.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FriendsBloc>.value(
        value: getIt<FriendsBloc>(),
        child: const Scaffold(body: FriendsView()));
  }
}

class FriendsView extends StatelessWidget {
  const FriendsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendsBloc, FriendsState>(
      builder: (context, state) {
        return SafeArea(
          child: SizedBox.expand(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Teman',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final friend = state.friends[index];
                      return ListTile(
                        onTap: () {
                          FriendLoanRoute(userUid: friend.uid).go(context);
                        },
                        title: Text(friend.name),
                        trailing: const Text('Detil'),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const Divider(height: 1),
                    itemCount: state.friends.length,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
