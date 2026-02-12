import 'package:flutter/material.dart';
import 'package:goldy_app/core/constants/app_strings.dart';
import 'package:goldy_app/core/networking/dio_helper.dart';
import 'package:goldy_app/core/routing/app_routes_config.dart';
import 'package:goldy_app/core/routing/app_routes_path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      initialRoute: AppRoutesPath.homeScreen,
      onGenerateRoute: AppRoutesConfig().generateRoute,
    );
  }
}
