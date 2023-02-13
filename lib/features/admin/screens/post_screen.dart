import 'package:amazone_clone/constants/loader.dart';
import 'package:amazone_clone/features/account/wedgets/single_product.dart';
import 'package:amazone_clone/features/admin/screens/add_product_screen.dart';
import 'package:amazone_clone/features/admin/services/admin_services.dart';
import 'package:amazone_clone/model/product.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Product>? products;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? Loader()
        : Scaffold(
            body: GridView.builder(
              itemCount: products!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                final productData = products![index];
                return Column(
                  children: [
                    SizedBox(
                      height: 140,
                      child: SingleProduct(image: productData.images[0]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            productData.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete),
                        )
                      ],
                    )
                  ],
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: navigateToAddProduct,
              tooltip: 'Add a product',
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
