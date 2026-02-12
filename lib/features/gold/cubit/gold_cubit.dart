import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy_app/features/gold/cubit/gold_state.dart';
import 'package:goldy_app/features/gold/data/repo/gold_repo.dart';

class GoldCubit extends Cubit<GoldState> {
  GoldCubit() : super(GoldInitialState());
  GoldRepo goldRepo = GoldRepo();

  Future<void> goldPrice() async {
    emit(GoldLoadingState());
    final response = await goldRepo.getGoldPrice();
    response.fold(
      (error) => emit(GoldErrorState(error)),
      (success) => emit(GoldSuccessState(success)),
    );
  }
}
