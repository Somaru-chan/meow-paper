import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:meow_paper/data/data.dart';
import 'package:meow_paper/model/wallpaper_model.dart';
import 'package:meow_paper/views/home.dart';
import 'package:meow_paper/widgets/widget.dart';
import 'package:http/http.dart' as http;
import 'package:profanity_filter/profanity_filter.dart';

class SearchPage extends StatefulWidget {

  final String? searchQuery;
  SearchPage({this.searchQuery});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  List<WallPaperModel> wallpapers = [];
  TextEditingController searchController = new TextEditingController();
  
  getSearchedWP(String query) async{

    //       // AnimatedButton(
    //       //   pressEvent: () {
    //       //     AwesomeDialog(
    //       //       context: context,
    //       //       dialogType: DialogType.ERROR,
    //       //       animType: AnimType.RIGHSLIDE,
    //       //       headerAnimationLoop: true,
    //       //       title: 'Error',
    //       //       desc: 'No results were found for your entered search terms.',
    //       //       btnOkOnPress: () {},
    //       //       btnOkIcon: Icons.cancel,
    //       //       btnOkColor: Colors.blue,
    //       //     )..show();
    //       //   }
    //       // ),
    // }

      var response = await http.get(Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=200"), 
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
    // }

  }

  @override
  void initState() {
    getSearchedWP(widget.searchQuery!);
    super.initState();
    searchController.text = widget.searchQuery!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(context),
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, 'home');
            }, 
            icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.blue.shade300), 
          ) 
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff5f8fd),
                    borderRadius: BorderRadius.circular(30),
                    // border: Border.all(color: Colors.blue, width: 0.3)
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: "Enter search terms",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      //ToDO: enter key will search in addition to search icon
                      GestureDetector(
                        onTap: () {
                          getSearchedWP(searchController.text);
                        },
                        child: Container(
                          child: Icon(
                            Icons.search, 
                            color: Colors.blue.shade300
                            // color: Colors.grey[600]
                            ,),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16,),
              SearchWallpapersList(wallpapers, searchController.text, context)
            ],
          ),
        ),
      ),
    );
  }
}