import 'package:flutter/material.dart';
import 'package:wallter/controller/api_operation.dart';
import 'package:wallter/model/photo_model.dart';
import 'package:wallter/views/widgets/category_block.dart';
import 'package:wallter/views/widgets/custum_appbar.dart';
import 'package:wallter/views/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<PhotosModel> trendingWallList;

  GetTrendingWallpapers() async {
    trendingWallList = await ApiOperations.getTrendingWallpapers();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    ApiOperations.getTrendingWallpapers();
    GetTrendingWallpapers();
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
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child:  Search(),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              height: 65,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) =>  CategoryBlock(name: 'CARS',),),
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
              itemBuilder: (context, index) => Container(
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
        ]),
      ),
    );
  }
}
