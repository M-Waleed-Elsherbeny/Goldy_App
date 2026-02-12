import 'package:dartz/dartz.dart';
import 'package:goldy_app/core/networking/api_constants.dart';
import 'package:goldy_app/core/networking/dio_helper.dart';
import 'package:goldy_app/features/silver/data/models/silver_model.dart';

class SilverRepo {
  Future<Either<String, SilverModel>> getSilverPrice() async {
    try {
      final response = await DioHelper.getData(
        endpoint: ApiConstants.silverEndPoint,
      );

      return Right(SilverModel.fromJson(response.data));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
