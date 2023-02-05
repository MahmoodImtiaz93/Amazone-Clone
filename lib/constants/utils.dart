import 'dart:io';

 
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();

  // ScaffoldMessenger.of(context).showSnackBar(
  //   SnackBar(
  //     content: Text(text),
  //   ),
  // );

  _messangerKey.currentState?.showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

