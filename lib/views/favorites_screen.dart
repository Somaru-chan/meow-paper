import 'package:flutter/material.dart';
import 'package:meow_paper/views/home.dart';
import 'package:meow_paper/widgets/widget.dart';

class Favorites extends StatefulWidget {
  const Favorites({ Key? key }) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,//Color(0xff724966),
      appBar: AppBar(
        title: brandName(context),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.grey),
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
              SizedBox(height: 350,),
              Center(
                child: Container(
                  child: Text('You don\'t have any favorites yet.',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 15,
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}