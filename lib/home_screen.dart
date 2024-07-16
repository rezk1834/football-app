import 'package:flutter/material.dart';

import 'components/square.dart';
import 'database/database.dart';

class home_screen extends StatelessWidget {
   home_screen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/main/wall.jpg"),fit:BoxFit.cover)
        ),
        child: Expanded(
          child: ListView.builder(
              itemCount: main_categories.length,
              itemBuilder: (context,index ){
                return square(
                  child: main_categories[index]['title']!,
                  pic: main_categories[index]['image']!,
                  path: main_categories[index]['path']!,
                );
              }),
        ),
      ),
    );
  }
}
