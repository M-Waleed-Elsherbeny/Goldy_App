import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy_app/core/constants/app_assets.dart';
import 'package:goldy_app/core/constants/app_colors.dart';
import 'package:goldy_app/features/gold/cubit/gold_cubit.dart';
import 'package:goldy_app/features/gold/cubit/gold_state.dart';

class GoldScreen extends StatelessWidget {
  const GoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      appBar: AppBar(
        backgroundColor: AppColors.kBlackColor,
        iconTheme: IconThemeData(color: AppColors.kGoldColor),
        centerTitle: true,
        title: const Text(
          'Gold Price',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColors.kGoldColor,
          ),
        ),
      ),
      body: BlocBuilder<GoldCubit, GoldState>(
        builder: (context, state) {
          return state is GoldSuccessState
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.goldImage),
                    Text(
                      "${state.goldModel.price.toStringAsFixed(2)}  EGP",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kGoldColor,
                      ),
                    ),
                  ],
                )
              : state is GoldLoadingState
              ? const Center(
                  child: CircularProgressIndicator(color: AppColors.kGoldColor),
                )
              : state is GoldErrorState
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
