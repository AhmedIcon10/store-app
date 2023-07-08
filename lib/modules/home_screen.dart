import 'package:flutter/material.dart';
import 'package:store_app/services/all_products_service.dart';
import 'package:store_app/shared/widgets.dart';

import '../shared/consts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = kHomeScreen;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    AllProductsService.getAllProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kHaiti,
      appBar: AppBar(
        backgroundColor: kHaiti,
        title: const Text(
          'N E W   T R E N D',
          style: TextStyle(
            color: kWhite,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.local_grocery_store,
              color: kWhite,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder(
        future: AllProductsService.getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic> products = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.only(top: 50),
              child: GridView.builder(
                clipBehavior: Clip.none,
                padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 90,
                ),
                itemBuilder: (context, index) => ProductItem(product:products[index] ),
                itemCount: products.length,
              ),
            );
          }
          else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
