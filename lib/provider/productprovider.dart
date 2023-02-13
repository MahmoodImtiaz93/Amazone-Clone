import 'package:amazone_clone/features/admin/services/admin_services.dart';
import 'package:amazone_clone/model/product.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];
  BuildContext? context;
  ProductProvider( ) {
    getAllProducts(context);
  }

  getAllProducts(context) async {
  //  products = await AdminServices.fetchAllProducts(context);
  notifyListeners();
  }
}
