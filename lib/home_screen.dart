import 'package:flutter/material.dart';

import 'components/main_square.dart';
import 'database/database.dart';

class home_screen extends StatelessWidget {
   home_screen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اختار التحدي', style: TextStyle(fontSize: 40),),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/main/wall.jpg"),fit:BoxFit.cover)
        ),
        child: ListView.builder(
            itemCount: main_categories.length,
            itemBuilder: (context,index ){
              return main_square(
                child: main_categories[index]['title']!,
                pic: main_categories[index]['image']!,
                path: main_categories[index]['path']!,
              );
            }),
      ),
    );
  }
}
