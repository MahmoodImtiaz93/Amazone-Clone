import 'dart:io';

import 'package:amazone_clone/constants/error_handaling.dart';
import 'package:amazone_clone/constants/utils.dart';
import 'package:amazone_clone/model/product.dart';
import 'package:amazone_clone/provider/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../constants/global_variable.dart';

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
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    print('initilized' + userProvider.user.token.toString());

    try {
      print('try block');
      final cloudinary = CloudinaryPublic('ddindzhz5', 'dwa6f4bx');
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
         print('inside loop');
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrls.add(res.secureUrl);
      }

      Product product = Product(
        name: name,
        description: description,
        quantity: quantity,
        images: imageUrls,
        category: category,
        price: price,
      );

      http.Response res = await http.post(
        Uri.parse('$uri/admin/add-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: product.toJson(),
        
      );
      print('Response body : '+res.body.toString());
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          print('On Success . Product Added SUccessfully!');
         // showSnackBar(context, 'Product Added Successfully!');
          Navigator.pop(context);
          
        //  print('on success'+userProvider.user.token.toString());
        },
      );
    } catch (e) {
      print('error'+userProvider.user.token.toString());
      showSnackBar(context, e.toString());
    }
  }
}
