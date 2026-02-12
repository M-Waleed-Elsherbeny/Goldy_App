import 'package:flutter/material.dart';
import 'package:goldy_app/core/constants/app_colors.dart';
import 'package:goldy_app/core/constants/app_strings.dart';
import 'package:goldy_app/core/routing/app_routes_path.dart';
import 'package:goldy_app/core/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              width: width / 2,
              height: height / 15,
              title: AppStrings.gold,
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutesPath.goldScreen),
            ),
            SizedBox(height: 40),
            CustomButton(
              width: width / 2,
              height: height / 15,
              backgroundColor: AppColors.kSilverColor,
              title: AppStrings.silver,
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutesPath.silverScreen),
            ),
          ],
        ),
      ),
    );
  }
}
