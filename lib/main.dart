import 'package:ecommerce_api/controllers/auth_controller.dart';
import 'package:ecommerce_api/controllers/cart_controller.dart';
import 'package:ecommerce_api/controllers/home_user_controller.dart';
import 'package:ecommerce_api/screens/mobile_screeens/home_screen_user.dart';
import 'package:ecommerce_api/screens/mobile_screeens/login_screen.dart';
import 'package:ecommerce_api/screens/windows/login_windows_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'const.dart';
import 'controllers/home_admin_controller.dart';
import 'controllers/product_controller.dart';

void main() {
  Get.put(HomeAdminController());
  Get.put(AuthController());
  Get.put(ProductController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.rightToLeft,
          theme: lightTheme(),
          darkTheme: darkTheme(),
          themeMode: ThemeMode.system,
          home: LoginWindowsScreen(),
          // LoginScreen
          // LoginWindowsScreen
        );
      },
    );
  }
}
