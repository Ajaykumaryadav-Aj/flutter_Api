
import 'dart:developer';

import 'package:flutter_api/apis/constant.dart';
import 'package:flutter_api/models/firstmodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Welcome>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstant.baseUrl + ApiConstant.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Welcome> _model = welcomeFromJson(response.body) as List<Welcome>;
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    
  }
}
