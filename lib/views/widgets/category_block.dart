import 'package:flutter/material.dart';
import 'package:wallter/views/screens/category.dart';

// ignore: must_be_immutable
class CategoryBlock extends StatelessWidget {
   CategoryBlock({super.key,required this.name});

  String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CategoryScreen(),
            ),
          );
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                  height: 50,
                  width: 100,
                  fit: BoxFit.cover,
                  'https://images.pexels.com/photos/358189/pexels-photo-358189.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
            ),
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black26,
              ),
            ),
             Positioned(
              left: 35,
              top: 15,
              child: Text(
                name,
                style:
                  const  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
