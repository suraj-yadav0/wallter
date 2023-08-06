import 'package:flutter/material.dart';
import 'package:wallter/views/screens/search_screen.dart';

// ignore: must_be_immutable
class Search extends StatelessWidget {
  Search({super.key});

 final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(66, 243, 245, 238),
        border: Border.all(
          color: Colors.black38,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText:
                    'Search Wallpapers', //hintStyle: TextStyle(color: Colors.black),
                // labelText: 'Search',
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
          InkWell(
            child: const Icon(Icons.search),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SearchScreen(query: _searchController.text),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
