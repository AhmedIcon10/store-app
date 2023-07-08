import 'package:flutter/material.dart';
import 'package:store_app/modules/detailed_product_screen.dart';
import 'package:store_app/modules/home_screen.dart';
import 'package:store_app/modules/login_screen.dart';
import 'package:store_app/modules/register_screen.dart';
import 'package:store_app/modules/update_product_screen.dart';
import 'package:store_app/services/all_products_service.dart';

import 'app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: HomeScreen.id,
    );
  }
}



// https://www.getpostman.com/collections/6da0a73ef5587fbe2a42
