import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:stack_food/data/network/base_api_service.dart';

import '../app_exception.dart';

class NetworkApiService extends BaseApiService{
  @override
  Future getApi(String url) async{
    dynamic responseJson;
    try{
      final response= await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson=returnResponse(response);
    }on SocketException{
      throw InterNetException();
    }on RequestTimeOut{
      throw RequestTimeOut();
    }
    return responseJson;
  }

  @override
  Future postApi(data, String url) async{
    dynamic responseJson;
    try{
      final response=await http.post(Uri.parse(url),body: data).timeout(const Duration(seconds: 10));
      responseJson=returnResponse(response);
    }on SocketException{
      throw InterNetException();
    }on RequestTimeOut{
      throw RequestTimeOut();
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400: // Bad Request
        dynamic errorResponse = jsonDecode(response.body);
        throw BadRequestException(errorResponse);
      case 401: // Unauthorized
      case 403: // Forbidden
        throw UnAuthorizedException('Unauthorized');
      case 500: // Internal Server Error
      default:
        throw FetchDataException(
            'Error occurred while communicating with the server: ${response.statusCode}');
    }
  }


}