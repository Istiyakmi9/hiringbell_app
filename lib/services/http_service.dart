import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hiringbell/models/api_response.dart';
import 'package:hiringbell/models/user.dart';
import 'package:hiringbell/utilities/Util.dart';

class HttpService extends GetConnect {
  static final HttpService ajax = HttpService._internal();

  HttpService._internal();

  String _baseUrl = "";
  String? _token;

  String get token => _token ?? "";

  set setToken(String value) {
    _token = value;
  }

  static HttpService getInstance() {
    // ajax.setBaseUrl("https://www.hiringbell.com/hb/api/");
    ajax.setBaseUrl("http://192.168.1.3:8090/hb/api/");
    return ajax;
  }

  void setBaseUrl(String baseUrl) {
    _baseUrl = baseUrl;
  }

  String get getBaseUrl {
    return _baseUrl;
  }

  String get getImageBaseUrl {
    return "https://www.hiringbell.com/resources/";
  }

  Map<String, String> header() {
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token ?? ""
    };
  }

  Map<String, String> imageHeader() {
    return {
      'Content-type': 'multipart/form-data',
      'Accept': 'application/json',
      'Authorization': token ?? ""
    };
  }

  Future<dynamic> httpGet(String url) async {
    var apiUrl = Uri.parse(getBaseUrl + url);
    debugPrint("Page url: $apiUrl");
    final response = await get('$apiUrl', headers: header());
    if (response.status.isOk) {
      var body = ApiResponse.fromJson(response.body);
      return body.responseBody;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }

  Future<ApiResponse> httpPost(String url, Map data) async {
    final response = await post(getBaseUrl + url, data, headers: header());
    if (response.status.isOk) {
      var body = ApiResponse.fromJson(response.body);
      return body;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }

  Future<String> login(String url, Map data) async {
    final response = await post(getBaseUrl + url, data, headers: header());
    if (response.status.isOk) {
      var body = ApiResponse.fromJson(response.body);
      User? user = User.fromJson(body.responseBody["UserDetail"]);

      if (user.email == null) {
        return "fail";
      } else {
        setToken = user.token!;
        Util util = Util.getInstance();
        util.setUserDetail(body.responseBody["UserDetail"]);
      }

      return "success";
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }

  Future<Response<T>> httpPut<T>(String url, Map body) async {
    final response = await put(getBaseUrl + url, body, headers: header());
    if (response.status.isOk) {
      return Response(
          body: response.body as T, statusCode: response.statusCode);
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }
}
