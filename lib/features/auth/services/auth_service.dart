import 'dart:convert';
import 'dart:developer';

import 'package:amazone_clone/common/bottom_bar.dart';
import 'package:amazone_clone/constants/error_handaling.dart';
import 'package:amazone_clone/constants/global_variable.dart';
import 'package:amazone_clone/constants/utils.dart';
import 'package:amazone_clone/model/user_model.dart';
import 'package:amazone_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../admin/screens/admin_screen.dart';

class AuthService {
  // sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        address: '',
        type: '',
        token: '',
        // cart: [],
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          print('Account created! Login with the same credentials!');
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );
    } catch (e) {
      log(e.toString());
      print(e.toString());
      showSnackBar(context, e.toString());
    }
  }

  // sign in user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            //  Future.delayed(const Duration(seconds: 2));
            WidgetsFlutterBinding.ensureInitialized();
            SharedPreferences prefs = await SharedPreferences.getInstance();
            // ignore: use_build_context_synchronously
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
            print(prefs.getString('x-auth-token'));
            // ignore: use_build_context_synchronously
            Future.delayed(Duration(seconds: 1)).then((value) {
              Navigator.of(context, rootNavigator: true)
                  .pushNamedAndRemoveUntil(
                      Provider.of<UserProvider>(context, listen: false)
                                  .user
                                  .type ==
                              'user'
                          ? BottomBar.routeName
                          : AdminScreen.routeName,
                      (route) => false);
            });
          });
    } catch (e) {
      //  showSnackBar(context, e.toString());
    }
  }

  // get user data
  void getUserData(
    BuildContext context,
  ) async {
    try {
      //    Future.delayed(Duration(seconds: 2));
      WidgetsFlutterBinding.ensureInitialized();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      print(token.toString());
      if (token == null) {
        print('token null section');
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      // showSnackBar(context, e.toString());
    }
  }
}
