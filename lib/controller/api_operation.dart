import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallter/model/photo_model.dart';

class ApiOperations {
  static List<PhotosModel> trendingWallpapers = [];
  static List<PhotosModel> searchWallpapersList = [];
  static Future<List<PhotosModel>> getTrendingWallpapers() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated"), headers: {
      'Authorization':
          'oo8vmszWg3vgfqmKDUPXfht8BuHeAmRDlbDpouvJr9IsBBzXZsAoVyu0'
    }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      photos.forEach((element) {
        trendingWallpapers.add(PhotosModel.fromApi2App(element));
      });
    });

    return trendingWallpapers;
  }

 static Future<List<PhotosModel>> searchWallpapers(String query) async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$query&per_page=30&page=1"),
        headers: {
          'Authorization':
              'oo8vmszWg3vgfqmKDUPXfht8BuHeAmRDlbDpouvJr9IsBBzXZsAoVyu0'
        }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      searchWallpapersList.clear();
      photos.forEach((element) {
        
        searchWallpapersList.add(PhotosModel.fromApi2App(element));
      });
    });

    return searchWallpapersList;
  }
}
