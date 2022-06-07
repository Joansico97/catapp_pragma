import 'package:catapp_pragma/models/cat_model.dart';
import 'package:catapp_pragma/services/dio_service.dart';
import 'package:catapp_pragma/utils/constans.dart';

class _CatService extends DioService {
  Future<List<Cat>> getCats() async {
    final response = await super.getAllData(
      Constans.baseUrl,
      authorization: Constans.apiKey,
    );

    return List<Cat>.from(response.map((json) => Cat.fromJson(json)));
  }

  Future<List<Cat>> searchCat({required String query}) async {
    final response = await super.getSearchData(
      Constans.baseUrl,
      authorization: Constans.apiKey,
      query: query,
    );

    return List<Cat>.from(response.map((json) => Cat.fromJson(json)));
  }
}

final catService = _CatService();
