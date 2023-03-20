import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:chatgpt_mobile/constants/api_consts.dart';
import 'package:chatgpt_mobile/models/models.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<Models>> getModels() async {
    try {
      var response = await http.get(
        Uri.https("$BASE_URL", "v1/models"),
        headers: {'Authorization': 'Bearer $API_KEY'},
      );

      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        // print("jsonResponse['error'] ${jsonResponse['error']["message"]}");
        throw HttpException(jsonResponse['error']["message"]);
      }
      // print("jsonResponse $jsonResponse");
      List temp = [];
      for (var value in jsonResponse["data"]) {
        temp.add(value);
        print("temp ${value["id"]}");
      }
      return Models.modelsFromSnapshot(temp);
    } catch (error) {
      print("error $error");
      rethrow;
    }
  }
}
