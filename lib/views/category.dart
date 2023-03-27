import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meow_paper/data/data.dart';
import 'package:meow_paper/model/wallpaper_model.dart';
import 'package:meow_paper/widgets/widget.dart';

class Category extends StatefulWidget {
  const Category({ Key? key, this.categoryName }) : super(key: key);

  final String? categoryName;

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  List<WallPaperModel> wallpapers = [];
  TextEditingController searchController = new TextEditingController();

  getCategoryWP(String query) async{

    var response = await http.get(Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=100"), 
    headers: {
      "Authorization" : apiKey,
    });

    // print(response.body.toString());

    Map<String,dynamic> jsonData = jsonDecode(response.body);

    jsonData["photos"].forEach((element){
      // print(element);
      WallPaperModel wallPaperModel = new WallPaperModel();
      wallPaperModel = WallPaperModel.fromMap(element);
      wallpapers.add(wallPaperModel);

    });

    setState(() {
      
    });

  }

  @override
  void initState() {
    getCategoryWP(widget.categoryName!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(context),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
                SizedBox(height: 16,),
              WallpapersList(wallpapers, context)
            ],
          ),
        ),
      ),
    );
  }
}