import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/all_products_service.dart';

import '../shared/consts.dart';

class DetailedProductScreen extends StatelessWidget {
  final ProductModel product;
  static String id = kDetailedScreen;
  const DetailedProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kHaiti,
      appBar: AppBar(
        title: Text(product.title.toString()),
        centerTitle: true,
      ),
      body: Container(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(color: kWhite),
              height: height * 0.33,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.network(
                      product.image.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * .05, horizontal: width * .05),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.title.toString(),
                          style: const TextStyle(
                            color: kWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            wordSpacing: 5,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                      SizedBox(
                        width: width * .05,
                      ),
                      RatingBarIndicator(
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        direction: Axis.horizontal,
                        itemSize: 35,
                        rating: 2.8,
                        unratedColor: kWhite,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  //description=>
                  Text(
                    product.description.toString(),
                    maxLines: 5,
                    style: const TextStyle(
                      color: kWhite,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * .05, horizontal: width * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * .40,
                    height: height * .08,
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        '\$ ${product.price.toString()}',
                        style: TextStyle(
                          color: kGovernorBay,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: width * .40,
                      height: height * .08,
                      decoration: BoxDecoration(
                        color: kGovernorBay,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: width * .02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Add to cart',
                                  style: TextStyle(
                                    color: kWhite,
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const CircleAvatar(
                                  backgroundColor: kWhite,
                                  child: Icon(
                                    Icons.add,
                                    size: 30,
                                    color: kGovernorBay,
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
