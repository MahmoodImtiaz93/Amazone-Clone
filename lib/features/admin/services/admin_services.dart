import 'dart:io';

import 'package:amazone_clone/constants/utils.dart';
import 'package:flutter/cupertino.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    try {
      
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
