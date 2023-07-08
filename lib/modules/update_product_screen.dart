import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/shared/components.dart';
import 'package:store_app/shared/consts.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});
  static String id = kUpdateScreen;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final productNameController = TextEditingController();

  final priceController = TextEditingController();

  final descController = TextEditingController();

  final imageController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? productName;
  String? desc;
  String? image;
  dynamic price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kHaiti,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kHaiti,
          title: const Text(
            'UPDATE PRODUCT',
            style: TextStyle(
              color: kWhite,
            ),
          ),
          centerTitle: true,
          elevation: 1,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.18,
                  ),
                  CustomFormField(
                    controller: productNameController,
                    onChange: (data) {
                      productName = data;
                    },
                    type: TextInputType.text,
                    label: 'Product name',
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  CustomFormField(
                    controller: descController,
                    onChange: (data) {
                      desc = data;
                    },
                    type: TextInputType.text,
                    label: 'Description',
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  CustomFormField(
                    controller: priceController,
                    onChange: (data) {
                      price = data;
                    },
                    type: TextInputType.number,
                    label: 'Price ',
                    isPassword: false,
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  CustomFormField(
                    controller: imageController,
                    onChange: (data) {
                      image = data;
                    },
                    type: TextInputType.text,
                    label: 'Image',
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  DefaultButton(
                      buttonText: 'UPDATE',
                      textSize: 18,
                      onPressed: () async {
                        isLoading = true;
                        setState(() {});

                        try {
                          await updateProduct(product);
                        } catch (e) {
                          print(e.toString());
                        }
                        isLoading = false;
                        setState(() {});
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id!.toString(),
        title: productName == null ? product.title.toString() : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description.toString() : desc!,
        image: image == null ? product.image.toString() : image!,
        category: product.category!);
  }
}
