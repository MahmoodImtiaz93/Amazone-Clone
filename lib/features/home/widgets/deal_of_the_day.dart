import 'package:amazone_clone/constants/loader.dart';
import 'package:amazone_clone/features/home/services/home_services.dart';
import 'package:amazone_clone/features/product_details/screen/product_details_screen.dart';
import 'package:amazone_clone/model/product.dart';
import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  Product? product;
  final HomeServices homeServices = HomeServices();
  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
    product = await homeServices.fetchDealOfDay(context: context);
    setState(() {});
  }

  void navigateToDetailScreen() {
    Navigator.pushNamed(
      context,
      ProductDetailScreen.routeName,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Loader()
        : product!.name.isEmpty
            ? const SizedBox()
            : GestureDetector(
                onTap: () {
                  navigateToDetailScreen();
                },
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      // ignore: prefer_const_constructors
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 15.0),
                        child: const Text(
                          'Deal of the day!',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                    Image.network(product!.images[0],
                        height: 232, fit: BoxFit.fitHeight),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          '\$900.0',
                          style: TextStyle(fontSize: 18.0),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 15, top: 5, right: 40),
                        child: Text(
                          'Asus head phone',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: product!.images
                            .map(
                              (e) => Image.network(e,
                                  fit: BoxFit.fitWidth,
                                  width: 100,
                                  height: 100),
                            )
                            .toList(),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15)
                          .copyWith(left: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'See all deals',
                        style: TextStyle(color: Colors.cyan[800]),
                      ),
                    )
                  ],
                ),
              );
  }
}
