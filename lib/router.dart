import 'package:amazone_clone/common/bottom_bar.dart';
import 'package:amazone_clone/features/admin/screens/add_product_screen.dart';
import 'package:amazone_clone/features/admin/screens/admin_screen.dart';
import 'package:amazone_clone/features/auth/screens/auth_screen.dart';
import 'package:amazone_clone/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (context) => AuthScreen(),
      );

      case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (context) => HomeScreen(),
      );
      
      case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (context) => BottomBar(),
      );

  case AdminScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (context) => AdminScreen(),
      );

       case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (context) => AddProductScreen(),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('Screen Does Not Exist!'),
          ),
        ),
      );
  }
}
