import 'package:store_app/models/product_model.dart';
import '../helper/api.dart';

class AllProductsService {
  static Future getAllProducts() async {
    List<dynamic> data =
        await Api.get(url: 'https://fakestoreapi.com/products');
    List<dynamic> productList = [];
    for (Map<String, dynamic> item in data) {
      productList.add(
        ProductModel.fromJson(item),
      );
    }
    return productList;
  }
}
