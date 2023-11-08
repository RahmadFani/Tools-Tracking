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
    return Container(
      constraints: const BoxConstraints.expand(),
      color: Colors.white,
      child: BorrowedToolsView(
        tool: Tools.jokoTools
            .where((element) => element.idUnique == toolsId)
            .toList()
            .first,
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
          Padding(
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
                      'SISA ${tool.count}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
          const Divider(
            height: 1,
          ),
          ListTile(
            onTap: () {},
            title: const Text('Dipinjam Ke'),
            trailing: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '3 orang',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tambahkan Peminjam',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Autocomplete<String>(
                      optionsBuilder: (textEditingValue) {
                        return [];
                      },
                      fieldViewBuilder: (BuildContext context,
                          TextEditingController textEditingController,
                          FocusNode focusNode,
                          VoidCallback onFieldSubmitted) {
                        return TextField(
                          decoration: const InputDecoration(
                              labelText: 'Peminjam',
                              hintText: 'Masukkan nama peminjam',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10)),
                          controller: textEditingController,
                          focusNode: focusNode,
                          onSubmitted: (String value) {
                            onFieldSubmitted.call();
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Pinjamkan',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
