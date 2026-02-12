import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy_app/features/silver/cubit/silver_state.dart';
import 'package:goldy_app/features/silver/data/repo/silver_repo.dart';

class SilverCubit extends Cubit<SilverState> {
  SilverCubit() : super(SilverInitialState());
  SilverRepo silverRepo = SilverRepo();

  Future<void> silverPrice() async {
    emit(SilverLoadingState());
    final response = await silverRepo.getSilverPrice();
    response.fold(
      (error) => emit(SilverErrorState(error)),
      (success) => emit(SilverSuccessState(success)),
    );
  }
}
