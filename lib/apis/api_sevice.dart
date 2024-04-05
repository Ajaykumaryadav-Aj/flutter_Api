import 'dart:developer';

import 'package:flutter_api/constant.dart';
import 'package:flutter_api/models/photo_model.dart';
import 'package:flutter_api/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstant.baseUrl + ApiConstant.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> model = userModelFromJson(response.body);
        log(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class PhotosService {
  Future<List<PhotoModel>?> getPhotos() async {
    try {
      var url = Uri.parse(ApiConstant.photosUrl + ApiConstant.photosEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<PhotoModel> model = photoModelFromJson(response.body);
        log(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
