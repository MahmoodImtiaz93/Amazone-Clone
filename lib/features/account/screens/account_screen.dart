import 'package:amazone_clone/constants/global_variable.dart';
import 'package:amazone_clone/features/account/wedgets/bellow_app_bar.dart';
import 'package:amazone_clone/features/account/wedgets/orders.dart';
import 'package:amazone_clone/features/account/wedgets/top_buttons.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/amazon_in.png',
                  width: 120,
                  height: 45,
                  color: Colors.black,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(Icons.notifications_outlined),
                    ),
                    Icon(Icons.search_outlined),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const BelowAppBar(),
          const SizedBox(
            height: 10.0,
          ),
          TopButtons(),
          const SizedBox(
            height: 20.0,
          ),
          Orders()
        ],
      ),
    );
  }
}
