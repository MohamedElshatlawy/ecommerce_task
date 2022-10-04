import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static void showErrorDialog(
      {required String msg, required BuildContext ctx}) {
    showDialog(
        context: ctx,
        builder: (ctx) => CupertinoAlertDialog(
              title: Text(
                msg,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              actions: [
                TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.black,
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text(
                      'ok',
                    ))
              ],
            ));
  }
}
