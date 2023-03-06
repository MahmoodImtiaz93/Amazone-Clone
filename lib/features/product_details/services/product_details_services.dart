import 'dart:convert';
import 'dart:io';

import 'package:amazone_clone/constants/error_handaling.dart';
import 'package:amazone_clone/constants/global_variable.dart';
import 'package:amazone_clone/constants/utils.dart';
import 'package:amazone_clone/model/product.dart';
import 'package:amazone_clone/model/user_model.dart';
import 'package:amazone_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ProductDetailsServices {
  void addToCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/add-to-cart'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id!,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          User user =
              userProvider.user.copyWith(cart: jsonDecode(res.body)['cart']);
          userProvider.setUserFromModel(user);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
  
  void rateProduct({
    required BuildContext context,
    required Product product,
    required double rating,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    print('initilized' + userProvider.user.token.toString());

    try {
      print('try block');
      http.Response res = await http.post(
        Uri.parse('$uri/api/rate-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id!,
          'rating': rating,
        }),
      );
      print('Response body : ' + res.body.toString());
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          print('On Success . Rating Added SUccessfully!');
        },
      );
    } catch (e) {
      print('error' + userProvider.user.token.toString());
      showSnackBar(context, e.toString());
    }
  }
}
