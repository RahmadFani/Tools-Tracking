part of '../borrowed_tools.dart';

class _BorrowedToolsForm extends StatefulWidget {
  const _BorrowedToolsForm({required this.tool});

  final Tools tool;
  String get toolsId => tool.idUnique;

  @override
  State<_BorrowedToolsForm> createState() => _BorrowedToolsFormState();
}

class _BorrowedToolsFormState extends State<_BorrowedToolsForm> {
  Friends? friends;

  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BorrowedToolsBloc, BorrowedToolsState>(
      builder: (context, borrowedState) {
        final remaining = widget.tool.count -
            borrowedState.borrowed
                .where((element) => element.toolId == widget.toolsId)
                .map((e) => e.borrowedCount)
                .sum;
        return BlocBuilder<FriendsBloc, FriendsState>(
          builder: (context, friendsState) {
            return Expanded(
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
                      Autocomplete<Friends>(
                        optionsBuilder: (textEditingValue) {
                          if (textEditingValue.text == '') {
                            return const Iterable<Friends>.empty();
                          }
                          return friendsState.friends.where((Friends fr) {
                            return fr.uniqueName.contains(
                              textEditingValue.text
                                  .toLowerCase()
                                  .replaceAll(' ', '/'),
                            );
                          });
                        },
                        displayStringForOption: (option) {
                          return option.name;
                        },
                        onSelected: (option) {
                          setState(() {
                            friends = option;
                            _controller.text = option.name;
                          });
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
                            controller: _controller,
                            focusNode: focusNode,
                            onChanged: (value) {
                              textEditingController.text = value;
                              friends = null;
                            },
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
                          onPressed: remaining == 0 ? null : _submit,
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
            );
          },
        );
      },
    );
  }

  /// ### NOTE :
  ///
  /// Need clean this _submit function to many repeat code
  void _submit() async {
    FocusScope.of(context).unfocus();
    if (_controller.text.isEmpty) {
      context.showCustomAlertWaiting(
          message: 'Harap nama di isi',
          icon: Icons.warning,
          color: Theme.of(context).primaryColor);
      return;
    }

    final borrowed = context.read<BorrowedToolsBloc>();
    if (friends != null) {
      if (checkedItemAlreadyBorrow(friends!.uid)) {
        final res2 = await context.showCustomDialogWaiting(
          message: '${friends!.name}, sudah pernah pinjam',
          action: TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text('Pinjamkan Lagi'),
          ),
        );
        if (res2 == null) return;
        borrowed.add(
          BorrowToUser(toolsId: widget.toolsId, userId: friends!.uid),
        );

        setState(() {
          friends = null;
          _controller.text = '';
        });
      } else {
        borrowed.add(
          BorrowToUser(toolsId: widget.toolsId, userId: friends!.uid),
        );

        setState(() {
          friends = null;
          _controller.text = '';
        });
      }
    } else {
      final friendsList = context.read<FriendsBloc>().state.friends;
      final hasFriend = friendsList.firstWhereOrNull((fr) => fr.uniqueName
          .contains(_controller.text.toLowerCase().replaceAll(' ', '/')));
      if (hasFriend != null) {
        final res = await context.showCustomDialogWaiting(
            message:
                'Nama teman sudah terdaftar\nJika ingin buat baru kasih kata unik ke nama',
            action: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'old_user');
                  },
                  child: const Text('Pake yang ada'),
                ),
              ],
            ));
        if (res == null) return;
        if (res == 'old_user' && mounted) {
          if (checkedItemAlreadyBorrow(hasFriend.uid)) {
            final res2 = await context.showCustomDialogWaiting(
              message: '${hasFriend.name}, sudah pernah pinjam',
              action: TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('Pinjamkan Lagi'),
              ),
            );
            if (res2 == null) return;
            borrowed.add(
              BorrowToUser(toolsId: widget.toolsId, userId: hasFriend.uid),
            );

            setState(() {
              friends = null;
              _controller.text = '';
            });
          } else {
            borrowed.add(
              BorrowToUser(toolsId: widget.toolsId, userId: hasFriend.uid),
            );

            setState(() {
              friends = null;
              _controller.text = '';
            });
          }
          return;
        }
      }

      borrowed.add(
        BorrowToNewUser(toolsId: widget.toolsId, userName: _controller.text),
      );

      setState(() {
        friends = null;
        _controller.text = '';
      });
    }
  }

  bool checkedItemAlreadyBorrow(String userId) {
    final borrowed = context.read<BorrowedToolsBloc>();

    if (borrowed.state.borrowed
        .where((element) =>
            element.toolId == widget.toolsId && element.userId == userId)
        .isNotEmpty) {
      return true;
    }
    return false;
  }
}
