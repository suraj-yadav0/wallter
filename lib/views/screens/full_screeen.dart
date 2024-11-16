import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

import 'package:open_file/open_file.dart';



// ignore: must_be_immutable
class FullScreen extends StatelessWidget {
  String imgUrl;
  FullScreen({super.key, required this.imgUrl});
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();
  Future<void> setWallpaperFromFile(
      String wallpaperUrl, BuildContext context) async {
    ScaffoldMessenger.of(context)
        .showSnackBar( const SnackBar(content: Text("Downloading Started...")));
    try {
      // Saved with this method.
      var imageId = await ImageDownloader.downloadImage(wallpaperUrl);
      if (imageId == null) {
        return;
      }
      // Below is a method of obtaining saved image information.
     // var fileName = await ImageDownloader.findName(imageId);
      var path = await ImageDownloader.findPath(imageId);
    //  var size = await ImageDownloader.findByteSize(imageId);
   //   var mimeType = await ImageDownloader.findMimeType(imageId);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Downloaded Sucessfully"),
        action: SnackBarAction(
            label: "Open",
            onPressed: () {
              OpenFile.open(path);
            }),
      ));
     // print("IMAGE DOWNLOADED");
    } on PlatformException catch (error) {
   //   print(error);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error Occured - $error")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      key: _scaffoldKey,
      floatingActionButton: ElevatedButton(
          onPressed: () async {
            await setWallpaperFromFile(imgUrl, context);
          },
          // child: const Text("Download"),
          
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.amber,elevation: 1,
            side: const BorderSide(width: 2,color: Colors.amber)
            
          ),
          child: const Icon(Icons.download_sharp),
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imgUrl), fit: BoxFit.cover)),
      ),
    );
  }
}