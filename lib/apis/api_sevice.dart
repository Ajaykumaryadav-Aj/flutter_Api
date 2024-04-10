import 'dart:developer';

import 'package:flutter_api/constant.dart';
import 'package:flutter_api/models/album_model.dart';
import 'package:flutter_api/models/photo_model.dart';
import 'package:flutter_api/models/post_model.dart';
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

class AlbumService {
  Future<List<AlbumModel>?> getAlbum() async {
    try {
      var url = Uri.parse(ApiConstant.albumUrl + ApiConstant.albumEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<AlbumModel> model = albumModelFromJson(response.body);
        log(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class PostService {
  Future<List<PostModel>?> getPost() async {
    try {
      var url = Uri.parse(ApiConstant.postUrl + ApiConstant.postEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<PostModel> model = postModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
