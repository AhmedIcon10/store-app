import 'package:store_app/helper/api.dart';

import '../models/product_model.dart';
class UpdateProductService{
  Future<ProductModel> updateProduct({
    required String title,
    required dynamic price,
    required String desc,
    required String image,
    required String category,
    required String id,
  }) async {
    Map<String, dynamic> data = await Api.put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title' : title,
        'price' : price,
        'description' : desc,
        'image' : image,
        'category' : category,
        'id' : id,
      },
      token: '',
    );

    return ProductModel.fromJson(data);
  }
}