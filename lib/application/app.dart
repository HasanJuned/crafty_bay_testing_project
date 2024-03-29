import 'package:crafty_bay_testing_project/application/state_holders_binders.dart';
import 'package:crafty_bay_testing_project/presentation/ui/screens/splash_screen.dart';
import 'package:crafty_bay_testing_project/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      initialBinding: GetXBindings(),
      theme: ThemeData(
        primarySwatch: MaterialColor(AppColors.primaryColor.value, AppColors().color),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
                fontSize: 16, letterSpacing: 0.5, fontWeight: FontWeight.w600),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
        ),
      ),
    );
  }
}
