import 'package:get/get.dart';

import '../articles_model.dart';

class ArticlesProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Articles.fromJson(map);
      if (map is List)
        return map.map((item) => Articles.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
    const baseUrl = 'https://newsdata.io/api/1/news?apikey=pub_138010a1305df077c6c1798d639665e752026&language=en';
  }

  Future<List<dynamic>> getArticles(String lang) async {
    final response = await get('https://newsdata.io/api/1/news?apikey=pub_138010a1305df077c6c1798d639665e752026&language='+lang);
    if (response.status.code == 200) {  
    return response.body['results'];
    }
  }

  Future<Response<Articles>> postArticles(Articles articles) async =>
      await post('articles', articles);
  Future<Response> deleteArticles(int id) async => await delete('articles/$id');
}
