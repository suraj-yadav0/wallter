import 'package:flutter/material.dart';
import 'package:wallter/controller/api_operation.dart';
import 'package:wallter/model/category_model.dart';
import 'package:wallter/model/photo_model.dart';
import 'package:wallter/views/screens/full_screeen.dart';
import 'package:wallter/views/widgets/category_block.dart';
import 'package:wallter/views/widgets/custum_appbar.dart';
import 'package:wallter/views/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<PhotosModel> trendingWallList;  late List<CategoryModel> catModList;
  bool isLoading = true;

  getCatDetails() async {
    catModList = await ApiOperations.getCategoriesList();
    // print("GETTTING CAT MOD LIST");
    // print(catModList);
    setState(() {
      catModList = catModList;
    });
  }


  getTrendingWallpapers() async {
    trendingWallList = await ApiOperations.getTrendingWallpapers();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    ApiOperations.getTrendingWallpapers();
    getTrendingWallpapers();
    getCatDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: CustomAppBar(
          word1: 'Wallpaper',
          word2: ' God',
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: isLoading ? const Center(child: CircularProgressIndicator(),) :  SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Search(),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              height: 65,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: catModList.length,
                itemBuilder: (context, index) => CatBlock(

                  categoryImgSrc: catModList[index].catImgUrl,
                  categoryName: catModList[index].catName,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 10,
                mainAxisExtent: 400,
              ),
              itemCount: trendingWallList.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          FullScreen(imageUrl: trendingWallList[index].imgSrc),
                    ),
                  );
                },
                child: Hero(
                  tag: trendingWallList[index].imgSrc,
                  child: Container(
                    height: 500,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amberAccent,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                          height: 500,
                          width: 50,
                          fit: BoxFit.cover,
                          trendingWallList[index].imgSrc),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
