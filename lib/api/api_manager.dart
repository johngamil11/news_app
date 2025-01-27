import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constatnt.dart';
import 'package:news_app/model/NewsRespose.dart';
import 'package:news_app/model/SourceResponse.dart';
/*
https://newsapi.org/v2/top-headlines/sources?apiKey=42c8fa7b7a38410aa9a43835c4039204
*/
class ApiManager {
  static Future<SourceResponse?> getSources(String categoryID) async {
  Uri ur1 = Uri.https(ApiConstatnt.baseUrl , ApiConstatnt.sourcesApi,{
    'apiKey': '42c8fa7b7a38410aa9a43835c4039204',
    'category': categoryID,
  });
  var response = await http.get(ur1);
  try { var responseBody = response.body ; /// string
  var json = jsonDecode(responseBody); /// json
  return SourceResponse.fromJson(json); /// object
    /// SourceResponse.fromJson(jsonDecode(responseBody)); /// nafs el 5twat elly fatt}
} catch(e){
    throw e ;
  }
  }


/*
https://newsapi.org/v2/everything?q=bitcoin&apiKey=42c8fa7b7a38410aa9a43835c4039204
*/

  static Future<NewsRespose?> getNewsBySourceID (String sourceId)async{
  Uri url = Uri.https(ApiConstatnt.baseUrl ,ApiConstatnt.newsApi , {
    'apiKey' : '42c8fa7b7a38410aa9a43835c4039204',
    'sources' : sourceId

  } );

  var response = await http.get(url);
  try{  return NewsRespose.fromJson(jsonDecode(response.body));
  } catch(e){
    throw e ;
  }
  }

}

