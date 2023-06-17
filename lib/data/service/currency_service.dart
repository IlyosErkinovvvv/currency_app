import 'package:currency_app/core/config/dio_catch_config.dart';
import 'package:currency_app/core/config/dio_config.dart';
import 'package:currency_app/data/model/currency_model.dart';
import 'package:dio/dio.dart';

class CurrencyService {
  static Future<dynamic> getCurrency() async {
    try {
      Response response = await DioConfig.createRequest()
          .get('https://nbu.uz/uz/exchange-rates/json/');
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => CurrencyModel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return DioCatchError.catchError(e);
    }
  }
}
