import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:wallpaper_app/api/my_exception.dart';

class ApiHelper {
  var base_url = "https://api.pexels.com/v1/";

  Future<dynamic> getApi(String url, {Map<String, String>? header}) async {
    late var jsonResponse;
    try {
      var response = await http.get(Uri.parse(base_url + url), headers: header);
      print(response);

      jsonResponse = checkResponse(response);
    } on SocketException {
      print('No Internet');
      throw FetchDataException('No Internet connection');
    }
    return jsonResponse;
  }

  dynamic checkResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with server with StatusCode:${response.statusCode}');
    }
  }
}
