import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

const primaryColor = Color(0xFF6E8BC5);
const swatchColor = Color(0xFF444444);
const darkColor = Color(0xFF303438);

const baseURL = "http://";
const iPv4Address = "10.0.0.8";
const port = "1337";

const URL = "$baseURL$iPv4Address:$port";


spaceBetween({double high = 0.0, width = 0.0}) {
  return SizedBox(
    width: width,
    height: high,
  );
}

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade200,
    primaryColor: primaryColor,
    accentColor: Color(0xFFd9dfe0),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: darkColor,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: primaryColor,
      elevation: 0,
      centerTitle: false,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.white,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      backgroundColor: darkColor,
      elevation: 0,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: TextStyle(color: Colors.red, fontSize: 10.0.sp),
      selectedLabelStyle: TextStyle(color: Colors.white, fontSize: 10.0.sp),
    ),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: darkColor,
    primaryColor: darkColor,
    accentColor: Color(0xFF222627),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: primaryColor,
      elevation: 0,
      centerTitle: false,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Color(0xFFffffff),
        ),
      ),
      iconTheme: IconThemeData(
        color: Color(0xFFffffff),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: swatchColor,
      elevation: 10,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: TextStyle(color: Colors.red, fontSize: 10.0.sp),
      selectedLabelStyle: TextStyle(color: Color(0xFFffffff), fontSize: 10.0.sp),
    ),
  );
}

const List<String> category = [
  'Technology',
  'Clothing',
  'Watch',
  'Electronic',
];

const List<String> size = [
  'S',
  'M',
  'L',
  'XL',
  'XXL',
  'XXXL',
];