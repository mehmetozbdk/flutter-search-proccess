import 'package:dio/dio.dart';
import 'package:flutter_search_procces/core/model/people_model.dart';

class ApiConnection {
  Future<List<Data>> getPeopleData() async {
    var http = Dio();
    var url = 'https://reqres.in/api/users?page=2';

    var response = await http.get(url);
    //  Map<String,dynamic> responseJson = jsonDecode(response.data);
    if (response.statusCode == 200) {
      List<Data>? list = People.fromJson(response.data).data;
    
      return list!;
    } else {
      throw Exception('hata kodu ${response.statusCode}');
    }
  }
}
