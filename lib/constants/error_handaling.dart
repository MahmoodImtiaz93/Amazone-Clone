import 'dart:convert';

import 'package:amazone_clone/constants/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(jsonDecode(response.body)['msg']),
                duration: Duration(milliseconds: 3000),
              ));
     // showSnackBar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      //showSnackBar(context, jsonDecode(response.body)['error']);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(jsonDecode(response.body)['error']),
                duration: Duration(milliseconds: 3000),
              ));
      break;
    default:
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(jsonDecode(response.body)),
                duration: Duration(milliseconds: 3000),
              ));
     // showSnackBar(context, response.body);
  }
}
