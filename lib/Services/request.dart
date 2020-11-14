import 'package:http/http.dart';
import 'dart:convert';
import 'package:hackaton_velt_app/Models/GetAll.dart';

const String _baseUrl = "http://192.168.0.18:8080";

Future<String> getUserId(String json) async {
  String url = '$_baseUrl/postLogin';

  Map<String, String> headers = {
    "Content-type": "application/json",
  };

  Response response = await post(url, headers: headers, body: json);

  if (response.statusCode == 200) {
    return response.body;
  } else {
    return "Error";
  }
}

