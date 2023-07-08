import 'package:flutter/material.dart';
import 'package:store_app/modules/detailed_product_screen.dart';
import 'package:store_app/modules/update_product_screen.dart';

import '../models/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel? product;
  const ProductItem({super.key,required this.product});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        Navigator.pushNamed(context, DetailedProductScreen.id, arguments: product);
        // Navigator.pushNamed(context, UpdateProductScreen.id,arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.2),
                  spreadRadius: 0,
                  offset: const Offset(10, 10),
                  blurRadius: 40,
                ),
              ],
            ),
            child: Card(
              elevation: 20,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      product!.title.toString().substring(0, 10),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          '\$ ${product!.price.toString()}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 15,
            top: -40,
            child: Image.network(
              product!.image.toString(),
              height: 100,
              width: 140,
            ),
          ),
        ],
      ),
    );
  }
}
