import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy_app/core/constants/app_assets.dart';
import 'package:goldy_app/core/constants/app_colors.dart';
import 'package:goldy_app/features/silver/cubit/silver_cubit.dart';
import 'package:goldy_app/features/silver/cubit/silver_state.dart';

class SilverScreen extends StatelessWidget {
  const SilverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      appBar: AppBar(
        backgroundColor: AppColors.kBlackColor,
        iconTheme: IconThemeData(color: AppColors.kSilverColor),
        centerTitle: true,
        title: const Text(
          'Silver Price',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColors.kSilverColor,
          ),
        ),
      ),
      body: BlocBuilder<SilverCubit, SilverState>(
        builder: (context, state) {
          return state is SilverSuccessState
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.silverImage),
                    Text(
                      "${state.silverModel.price.toStringAsFixed(2)}  EGP",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kSilverColor,
                      ),
                    ),
                  ],
                )
              : state is SilverLoadingState
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.kSilverColor,
                  ),
                )
              : state is SilverErrorState
              ? Center(
                  child: Text(
                    state.error,
                    style: TextStyle(color: AppColors.kGoldColor),
                  ),
                )
              : Container();
        },
      ),
    );
  }
}
