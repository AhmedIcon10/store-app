import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/modules/detailed_product_screen.dart';
import 'package:store_app/modules/home_screen.dart';
import 'package:store_app/modules/login_screen.dart';
import 'package:store_app/modules/register_screen.dart';
import 'package:store_app/modules/update_product_screen.dart';
import 'package:store_app/shared/consts.dart';

class AppRouter{
   static Route? generateRoute(RouteSettings settings){
    switch (settings.name){
      case kLoginScreen:
        return MaterialPageRoute(builder: (_)=> const LoginScreen());
        case kRegisterScreen:
        return MaterialPageRoute(builder: (_)=> const RegisterScreen());
        case kHomeScreen:
      return MaterialPageRoute(builder: (_)=> const HomeScreen());
        case kDetailedScreen:
          final product = settings.arguments as ProductModel;
        return MaterialPageRoute(builder: (_)=>  DetailedProductScreen(product: product,));
        case kUpdateScreen:
        return MaterialPageRoute(builder: (_)=> const UpdateProductScreen());

    }
    return null;
  }
}