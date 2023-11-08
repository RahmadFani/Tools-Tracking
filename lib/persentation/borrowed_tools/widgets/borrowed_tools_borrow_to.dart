part of '../borrowed_tools.dart';

class _BorrowedToolsBorrowTo extends StatelessWidget {
  const _BorrowedToolsBorrowTo({required this.tool});

  final Tools tool;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BorrowedToolsBloc, BorrowedToolsState>(
      builder: (context, state) {
        final borrowed =
            state.borrowed.where((element) => element.toolId == tool.idUnique);
        return ListTile(
          onTap: borrowed.isEmpty
              ? null
              : () {
                  Navigator.push(context, _BorrowedToolsUsers.open(tool));
                },
          title: const Text(
            'Dipinjam Ke',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${borrowed.length} orang',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
