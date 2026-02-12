import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy_app/core/presentation/home_screen.dart';
import 'package:goldy_app/core/routing/app_routes_path.dart';
import 'package:goldy_app/features/gold/cubit/gold_cubit.dart';
import 'package:goldy_app/features/gold/presentation/ui/gold_screen.dart';
import 'package:goldy_app/features/silver/cubit/silver_cubit.dart';
import 'package:goldy_app/features/silver/presentation/ui/silver_screen.dart';

class AppRoutesConfig {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesPath.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case AppRoutesPath.goldScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<GoldCubit>(
            create: (context) => GoldCubit()..goldPrice(),
            child: GoldScreen(),
          ),
        );
      case AppRoutesPath.silverScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SilverCubit>(
            create: (context) => SilverCubit()..silverPrice(),
            child: SilverScreen(),
          ),
        );

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
