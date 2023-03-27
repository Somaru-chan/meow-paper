import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageView extends StatefulWidget {

  final String? imgUrl;

  ImageView({required this.imgUrl});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {

  var filePath;
  bool permissionGranted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.imgUrl!,
            child: 
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(widget.imgUrl!, 
              fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    _save();
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 35,
                        width: MediaQuery.of(context).size.width/2.5,
                        decoration: BoxDecoration(
                          color: Color(0xFF1C1B1B).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(48)
                        ),
                      ),
                      Container(
                        height: 35,
                        width: MediaQuery.of(context).size.width/2.5,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.white54, width: 1),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue[500]?.withOpacity(0.8)
                        ),
                        child: Column(
                          children: [
                            Text("Save Wallpaper",
                            style: TextStyle(fontSize: 14, color: Colors.white, 
                            fontWeight: FontWeight.bold), softWrap: true),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Stack( 
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 35,
                        width: MediaQuery.of(context).size.width/2.5,
                        decoration: BoxDecoration(
                          color: Color(0xFF1C1B1B).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(48)
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 40),
                        height: 35,
                        width: MediaQuery.of(context).size.width/2.5,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.white54, width: 1),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.withOpacity(0.2)
                          // gradient: LinearGradient(
                          //   colors: [
                          //     //Color(0x36FFFFFF),
                          //     Color(0xFFF4DCDC).withOpacity(0.7),
                          //     // Color(0x0FFFFFFF),
                          //     Color(0xFFdcf4f4).withOpacity(0.7),
                          //   ],
                          // ),
                        ),
                        child: Column(
                          children: [
                            Text("Back",
                            style: TextStyle(fontSize: 14, color: Colors.white, 
                            fontWeight: FontWeight.w600), softWrap: true),
                            // Text("Image is saved in Photos", 
                            // style: TextStyle(fontSize: 11, color: Colors.white60),),
                          ],
                        ),
                      ),
                    ]
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //no internet access error-handling
  _save() async {
    await _askPermission();

      final snackBar = SnackBar(
      content: Center(
        child: const Text('Image Saved!', 
        style: TextStyle(
          color: Colors.white,
          fontSize: 14
        ),),
      ),
      backgroundColor: Colors.blue.withOpacity(0.7),
      elevation: 0.0,
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.12,
          right: MediaQuery.of(context).size.width * 0.2,
          left: MediaQuery.of(context).size.width * 0.2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    var response = await Dio().get(
      widget.imgUrl!, 
      options: Options(responseType: ResponseType.bytes));
    final result =
      await ImageGallerySaver.saveImage(Uint8List.fromList(response.data), quality: 120);

    print(result);
        
    Navigator.pop(context);

    
  }

  _askPermission() async {
    if (Platform.isIOS) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.photos,
      ].request();

    final info = statuses[Permission.photos].toString();
    print(info);
    }
  }
  
}

