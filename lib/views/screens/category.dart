import 'package:flutter/material.dart';

import 'package:wallter/views/widgets/custum_appbar.dart';


class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

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
          Stack(
            children: [
              Image.network(
                  height: 150,
                  
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  'https://images.pexels.com/photos/2662116/pexels-photo-2662116.jpeg'),
                  Container(
                      height: 150,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black38,
                  ),
                 const Positioned(top: 40,
                  left: 110,
                    child: Column(children: [
                    Text('catgegory',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w200,),),
                     Text('Mountains',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 30),),
                  ],))
            ],
          ),
          const SizedBox(
            height: 20,
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
              itemCount: 16,
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
                      'https://images.pexels.com/photos/1808284/pexels-photo-1808284.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
