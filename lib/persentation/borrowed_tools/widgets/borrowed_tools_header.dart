part of '../borrowed_tools.dart';

class _BorrowedToolsHeader extends StatelessWidget {
  const _BorrowedToolsHeader({
    required this.tool,
  });

  final Tools tool;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BorrowedToolsBloc, BorrowedToolsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8,
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Image.asset(
                  tool.assets,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tool.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'SISA ${tool.count - state.borrowed.where((element) => element.toolId == tool.idUnique).map((e) => e.borrowedCount).sum}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  )
                ],
              ))
            ],
          ),
        );
      },
    );
  }
}
