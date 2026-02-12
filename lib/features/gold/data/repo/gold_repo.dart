import 'package:dartz/dartz.dart';
import 'package:goldy_app/core/networking/api_constants.dart';
import 'package:goldy_app/core/networking/dio_helper.dart';
import 'package:goldy_app/features/gold/data/models/gold_model.dart';

class GoldRepo {
  Future<Either<String, GoldModel>> getGoldPrice() async {
    try {
      final response = await DioHelper.getData(
        endpoint: ApiConstants.goldEndPoint,
      );

      return Right(GoldModel.fromJson(response.data));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
