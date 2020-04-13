import 'package:dio/dio.dart';

class Service {
  getAll() async {
    Response response;
    response = await Dio().get("https://coronavirus-19-api.herokuapp.com/all");
    return response.data;
  }

  getCountry() {}
}
