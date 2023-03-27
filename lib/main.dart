import 'package:flutter/material.dart';
import 'package:flutter_no_internet_widget/flutter_no_internet_widget.dart';
import 'package:meow_paper/views/home.dart';
import 'package:meow_paper/views/image_view.dart';
import 'package:meow_paper/views/search.dart';

void main() {
  runApp(MyApp());
}

//image saved snackbar awaits permission granted

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return InternetWidget(
      offline: const Center(child: Text('No Internet Access', style: TextStyle(
        color: Colors.blue
      ),)),
      // ignore: avoid_print
      whenOffline: () => print('No Internet'),
      // ignore: avoid_print
      whenOnline: () => print('Connected to internet'),
      loadingWidget: const Center(child: Text('Loading')),
      online: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meow Paper',           
        theme: ThemeData(
          fontFamily: 'Raleway',
          appBarTheme: AppBarTheme(
            color: Colors.transparent,
          ),
          // primaryColor: Colors.grey[200],//Color(0xff724966), 
        ),
        home: HomePage(),
        routes: {
          'home' :(context) => HomePage(),
          'search' :(context) => SearchPage(),
        },
      ),
    );



    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Meow Paper',           
    //   theme: ThemeData(
    //     fontFamily: 'Raleway',
    //     appBarTheme: AppBarTheme(
    //       color: Colors.transparent,
    //     ),
    //     // primaryColor: Colors.grey[200],//Color(0xff724966), 
    //   ),
    //   home: HomePage(),
    //   routes: {
    //     'home' :(context) => HomePage(),
    //     'search' :(context) => SearchPage(),
    //   },
    // );
  }
}

