import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meow_paper/data/data.dart';
import 'package:meow_paper/model/categories_model.dart';
import 'package:meow_paper/model/wallpaper_model.dart';
import 'package:meow_paper/views/search.dart';
import 'package:meow_paper/widgets/widget.dart';
import 'package:http/http.dart' as http;

import 'category.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<CategoriesModel> categories = [];
  List<WallPaperModel> wallpapers = [];
  TextEditingController searchController = new TextEditingController();

  getTrendingWP() async{
    // add pages or loading more photos mechanism
    var response = await http.get(Uri.parse("https://api.pexels.com/v1/search?query=pets&page=2&per_page=50"), 
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
    getTrendingWP();
    categories = getCategories();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],//Color(0xff724966),
      appBar: AppBar(
        title: brandName(context),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.grey),
        automaticallyImplyLeading: false,
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: [
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.circular(30),
      //         ),
      //         child: Container(
      //           decoration: BoxDecoration(
      //             image: DecorationImage(
      //               image: AssetImage('assets/images/undraw_good_doggy_4wfq.png'),
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         selectedTileColor: Colors.grey[200],
      //         title: Text('Home', style: TextStyle(
      //           color: Colors.blue[400],
      //         ),),
      //           onTap: () {
      //             Navigator.push(context, MaterialPageRoute(
      //               builder: (context) => HomePage()));
      //           },
      //       ),
      //       ListTile(
      //         selectedTileColor: Colors.grey[200],
      //         title: Text('Favorites', style: TextStyle(
      //           color: Colors.blue[400],
      //           // pinkAccent[700],
      //         ),),
      //           onTap: () {
      //             Navigator.push(context, MaterialPageRoute(
      //               builder: (context) => Favorites()));
      //           },
      //       ),
      //       ListTile(
      //         selectedTileColor: Colors.grey[200],
      //         title: Text('About', style: TextStyle(
      //           color: Colors.blue[400],
      //         ),),
      //           onTap: () {
      //             Navigator.pop(context);
      //           },
      //       ),
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(30),
                ),
                margin: EdgeInsets.symmetric(horizontal: 24),
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "Enter Search Terms",
                          // hintStyle: TextStyle(color: Colors.blue.withOpacity(0.7)),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          if(value.isEmpty) {
                            print('Error: No Search Term Entered.');
                          // } else {
                          //   Navigator.push(context, MaterialPageRoute(
                          //   builder: (context) =>  SearchPage(
                          //     searchQuery: searchController.text,
                          //   )
                          // ),);
                          }
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>  SearchPage(
                              searchQuery: searchController.text,
                            )
                          ),);
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
              Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      title: categories[index].categoryName,
                      imgUrl: categories[index].imgUrl,
                    );
                  }),
              ),
              WallpapersList(wallpapers, context),
            ],
          ),
        ),
      ),
    );
  }
}



class CategoryTile extends StatelessWidget {

  final String imgUrl, title;

  CategoryTile({required this.imgUrl, required this.title});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Category(
            categoryName: title.toLowerCase(),
          ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 6),
        child: Stack(
          children: [
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(
              //       builder: (context) => ImageView(),
              //     ),);
              //   },
              // child: 
                ClipRRect(
                  child: Image.network(
                    imgUrl, 
                    height: 50, 
                    width: 100, 
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black26,
              ),
              height: 50, 
              width: 100,
              alignment: Alignment.center,
              child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14,),),
            ),
          ],
        ),
      ),
    );
  }
}