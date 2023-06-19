import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logo_finder_game/screen/homeScreen.dart';
import 'package:logo_finder_game/screen/splashScreen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/home",
        routes: {
          "/": (p0) => Game_SplashScreen(),
          "/home":(p0) => Game_Home(),
        },
      ),
    ),
  );
}
