import 'package:flutter/material.dart';
import 'package:goldy_app/core/presentation/home_screen.dart';
import 'package:goldy_app/core/routing/app_routes_path.dart';

class AppRoutesConfig {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesPath.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            );
          },
        );
    }
  }
}
