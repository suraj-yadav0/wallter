import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:wallter/model/category_model.dart';
import 'package:wallter/model/photo_model.dart';



class ApiOperations {
  static List<PhotosModel> trendingWallpapers = [];
  static List<PhotosModel> searchWallpapersList = [];
  static List<CategoryModel> cateogryModelList = [];

  static Future<List<PhotosModel>> getTrendingWallpapers() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated"), headers: {
      'Authorization':
          'oo8vmszWg3vgfqmKDUPXfht8BuHeAmRDlbDpouvJr9IsBBzXZsAoVyu0'
    }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      for (var element in photos) {
        trendingWallpapers.add(PhotosModel.fromApi2App(element));
      }
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
      for (var element in photos) {
        searchWallpapersList.add(PhotosModel.fromApi2App(element));
      }
    });

    return searchWallpapersList;
  }

  static List<CategoryModel> getCategoriesList() {
    List cateogryName = [
      "Cars",
      "Nature",
      "Bikes",
      "Street",
      "City",
      "Flowers",
      "Girls",
      "Architecture",
      "Technology",
      "Clothes",
      "India",
      "Places",
      "Movies",
      "Celebrity"
    ];
    cateogryModelList.clear();
    cateogryName.forEach((catName) async {
      final random =  Random();

      PhotosModel photoModel =
          (await searchWallpapers(catName))[0 + random.nextInt(11 - 0)];
      print("IMG SRC IS HERE");
      print(photoModel.imgSrc);
      cateogryModelList
          .add(CategoryModel(catImgUrl: photoModel.imgSrc, catName: catName));
    });

    return cateogryModelList;
  }
}
