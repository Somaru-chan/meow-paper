import 'package:flutter/material.dart';

class SplashAnimated extends StatelessWidget {
  const SplashAnimated({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo_with_name.png'),
            ),
          ),
        ),

      ],
    );
  }
}