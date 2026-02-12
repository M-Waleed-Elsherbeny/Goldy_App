
import 'package:goldy_app/features/silver/data/models/silver_model.dart';

abstract class SilverState {}

class SilverInitialState extends SilverState {}

class SilverLoadingState extends SilverState {}

class SilverSuccessState extends SilverState {
  final SilverModel silverModel;
  SilverSuccessState(this.silverModel);
}

class SilverErrorState extends SilverState {
  final String error;
  SilverErrorState(this.error);
}
