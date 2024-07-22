import 'package:dio/dio.dart';
import 'package:protection_app/app/data/models/breach_model.dart';

class BreachEmailSearchRepository {
  // final String _baseUrl = 'https://haveibeenpwned.com/api/v3/';
  // final String _apiKey = 'cf5d6d4e29684626aef533cd39c8cec1';
  static final Dio _dio = Dio();

  static final BaseOptions baseOption = BaseOptions(
      baseUrl: 'https://haveibeenpwned.com/api/v3/breachedaccount/',
      headers: {
        "hibp-api-key": 'cf5d6d4e29684626aef533cd39c8cec1',
      },
      queryParameters: Map<String, dynamic>.from(
        {
          'truncateResponse': 'false',
        },
      ));

  static Future<List<BreachModel>> searchMail(String email) async {
    try {
      _dio.options = baseOption;
      final response = await _dio.get(email);
      print('data  :${response.data}');
      print('status code : ${response.statusCode}');
      // print('status code : ${response.}');

      if (response.statusCode == 200) {
        if (response.data != null && response.data is List) {
          var list = (response.data as List<dynamic>)
              .map((e) => BreachModel.fromMap(e))
              .toList();
          print(list);
          // Navigation.push(page: DataBreachIn());
          return list;
        } else {
          return [];
        }
      } else if (response.statusCode == 404) {
        return [];
      } else {
        throw Exception('HTTP isteği başarısız: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print("error : ${e.error}");
      // return ResponseBreachEmailSearchModel(error: e.toString());

      throw Exception(e.toString());
    }
  }
}


  //   try {
  //     final response = await _dio.get('https://haveibeenpwned.com/api/v3/breachedaccount/$email');
  //     if (response.statusCode == 200) {
  //       return true; // E-posta adresi pwned
  //     } else if (response.statusCode == 404) {
  //       return false; // E-posta adresi pwned değil
  //     } else {
  //       throw Exception('Have I Been Pwned API isteği başarısız oldu');
  //     }
  //   } catch (e) {
  //     throw Exception('Have I Been Pwned API ile iletişim hatası: $e');
  //   }
  // }
