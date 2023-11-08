import 'package:flutter/material.dart';

extension CustomDialog on BuildContext {
  Future<void> showCustomAlertWaiting({
    IconData? icon,
    required String message,
    Color? color,
  }) async {
    await showDialog(
        useRootNavigator: false,
        context: this,
        builder: (_) => Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16),
                        child: Column(
                          children: [
                            if (icon != null)
                              Icon(
                                icon,
                                size: 40,
                                color: color,
                              ),
                            Material(
                              child: Text(
                                message,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        height: 1,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(this);
                          },
                          child: const Text('Kembali'))
                    ],
                  ),
                )
              ],
            ));
  }

  Future<dynamic> showCustomDialogWaiting({
    IconData? icon,
    required String message,
    Color? color,
    Widget? action,
  }) async {
    return await showDialog<dynamic>(
        useRootNavigator: false,
        context: this,
        builder: (_) => Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16),
                        child: Column(
                          children: [
                            if (icon != null)
                              Icon(
                                icon,
                                size: 40,
                                color: color,
                              ),
                            Material(
                              child: Text(
                                message,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      if (action != null) ...[
                        const Divider(
                          height: 1,
                        ),
                        action
                      ]
                    ],
                  ),
                )
              ],
            ));
  }
}
