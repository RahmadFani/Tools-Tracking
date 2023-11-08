part of '../tools.dart';

class _ToolCard extends StatelessWidget {
  const _ToolCard(this.tool);

  final Tools tool;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: Colors.grey,
          )),
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              _LabelCard(
                color: Colors.red,
                text: 'Sisa ${tool.count}',
              ),
              const SizedBox(
                width: 6,
              ),
              _LabelCard(
                color: Theme.of(context).primaryColor,
                text: 'Dipinjam 4',
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    tool.assets,
                    height: 60,
                    width: 60,
                  ),
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
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          BorrowedToolsRoute().go(context);
                        },
                        child: const Text(
                          'Pinjamkan',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _LabelCard extends StatelessWidget {
  const _LabelCard({required this.color, required this.text});

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(4)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      child: Text(
        text,
        style:
            TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13),
      ),
    );
  }
}
