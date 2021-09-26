import 'package:ecommerce_api/controllers/cart_controller.dart';
import 'package:ecommerce_api/controllers/home_user_controller.dart';
import 'package:ecommerce_api/screens/mobile_screeens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenUser extends StatelessWidget {
  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeUserController>(
      init: HomeUserController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("WOWO commerce"),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            actions: [
              IconButton(onPressed: ()=>Get.to(()=>SearchScreen()), icon: Icon(Icons.search),),
            ],
          ),
          body: controller.screens[controller.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            onTap: (index) {
              controller.changeCurrentIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_shopping_cart_sharp),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket_outlined),
                label: "Shop",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Search",
              ),
            ],
          ),
        );
      },
    );
  }
}
