import 'package:amazone_clone/constants/global_variable.dart';
import 'package:amazone_clone/features/account/wedgets/single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List list = [
    'https://images.unsplash.com/photo-1567581935884-3349723552ca?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bW9iaWxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bGFwdG9wfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aGVhZHBob25lc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FtZXJhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                child: const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Your Orders',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            Container(
              child: const Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  'See All',
                  style: TextStyle(color: Colors.cyan),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 170,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return SingleProduct(
                  image: list[index],
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
