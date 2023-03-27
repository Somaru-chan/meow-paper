import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meow_paper/model/wallpaper_model.dart';
import 'package:meow_paper/views/home.dart';
import 'package:meow_paper/views/image_view.dart';
import 'package:profanity_filter/profanity_filter.dart';

//app icon and brandname
Widget brandName(context) {
  return GestureDetector(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 35,
              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/pet_icon_01.png'),
                )
              ),
            ),
            SizedBox(width: 10,),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                children: <TextSpan>[
                  // old Meow Color: Color(0xfff9d5d7), Papers Color: white
                  TextSpan(text: 'Meow', style: TextStyle(color: Colors.pink),),
                  TextSpan(text: 'Papers', style: TextStyle(color: Colors.lightBlue[300]),),
                ],
              ),
            ),
          ],
        ),
        // Container(
        //   // alignment: Alignment.center,
        //   margin: EdgeInsets.only(right: 60),
        //   child: Text('Made with puppy love using Pexel API',
        //   style: TextStyle(
        //     color: Colors.grey[500],
        //     fontSize: 12
        //   ),),
        // ),
      ],
    ),
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())),
  );
}

//gridview of wallpapers
Widget WallpapersList(List<WallPaperModel> wallpapers, context) {
  return Container(
    color: Colors.transparent,
    // color: Colors.grey[200],
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpapers){
        return GridTile(
          child: GestureDetector(
            onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ImageView(
                      imgUrl: wallpapers.src!.portrait,
                    ),
                  ),);
                },
            child: Hero(
              tag: wallpapers.src!.portrait!,
              child: Container(
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(16),
                //   boxShadow: [
                //     BoxShadow(
                //       color: Colors.grey.shade800,
                //       offset: Offset(2,1.75),
                //       blurRadius: 4,
                //     )
                //   ]
                // ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(wallpapers.src!.portrait!, 
                  fit: BoxFit.cover,)
                ),
              ),
            ),
          ), 
        );
      }).toList(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
    ),
  );
}


Widget SearchWallpapersList(List<WallPaperModel> wallpapers, searchTerm, context) {

  // List<String> badWordsList = <String>['gun', 'weapon', 'war', 'sexx', 'sexxx', 'bikini', 'nude', 'nudity'];
  //   final filter = ProfanityFilter.filterAdditionally(badWordsList);

  //   if(filter.hasProfanity(searchTerm)) {
  //     print('Contains profanity!');
  //     return Center(
  //         child: Column(
  //           children: [
  //             // Container(
  //             //   child: SvgPicture.asset('assets/images/try_again_error.svg'),
  //             // ),
  //             Container(
  //               margin: EdgeInsets.symmetric(
  //                 vertical: MediaQuery.of(context).size.height*0.25, 
  //                 horizontal: MediaQuery.of(context).size.width*0.2),
  //               child: Text('Your search terms have not yielded any results. \n\n Please try again.', 
  //               style: TextStyle(color: Colors.black54, fontSize: 17), textAlign: TextAlign.center,),
  //             ),
  //           ],
  //         ),
  //       );
  //   }
  //   else{
      return Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: GridView.count(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          mainAxisSpacing: 6.0,
          crossAxisSpacing: 6.0,
          children: wallpapers.map((wallpapers){
            return GridTile(
              child: GestureDetector(
                onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ImageView(
                          imgUrl: wallpapers.src!.portrait,
                        ),
                      ),);
                    },
                child: Hero(
                  tag: wallpapers.src!.portrait!,
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(wallpapers.src!.portrait!, 
                      fit: BoxFit.cover,)
                    ),
                  ),
                ),
              ), 
            );
          }).toList(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        ),
      );
    // }
}