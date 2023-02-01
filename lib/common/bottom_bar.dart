import 'package:amazone_clone/constants/global_variable.dart';
import 'package:amazone_clone/features/home/screens/home_screen.dart';
import 'package:badges/badges.dart';

import 'package:flutter/material.dart';

import '../features/account/screens/account_screen.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
   int _page = 0;
  double bottomNavigationWidth = 42;
  double bottomNavigationBorderWidth = 5;

  List<Widget> pages=[
    HomeScreen(),
    AccountScreen(),
    const Center(child: Text('Cartddd')),
  ];


  void updatePage(int page){
    setState(() {
      _page=page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap:  updatePage,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: bottomNavigationWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: _page == 0
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: bottomNavigationBorderWidth),
                ),
              ),
              child: Icon(Icons.home_outlined),
            ),
            label: '',
          ),
          //profile
          BottomNavigationBarItem(
            icon: Container(
              width: bottomNavigationWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: _page == 1
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: bottomNavigationBorderWidth),
                ),
              ),
              child: Icon(Icons.person_outline_outlined),
            ),
            label: '',
          ),
          //Cart
          BottomNavigationBarItem(
            icon: Container(
              width: bottomNavigationWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: _page == 2
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: bottomNavigationBorderWidth),
                ),
              ),
              // ignore: prefer_const_constructors
              child: Badge(
                  badgeContent: const Text('2'),
                  badgeStyle:
                      BadgeStyle(elevation: 0, badgeColor: Colors.white),
                  child: const Icon(Icons.shopping_bag_outlined)),
            ),
            label: '',
          )
        ],
      ),
    );
  }
}
