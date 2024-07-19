import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/saba7o_square.dart';
import '../database/database.dart';

class saba7o extends StatefulWidget {
  const saba7o({super.key});

  @override
  State<saba7o> createState() => _saba7oState();
}

class _saba7oState extends State<saba7o> {
  int red_score = 0;
  int blue_score = 0;

  void updateScores(int newRedScore, int newBlueScore) {
    setState(() {
      red_score = newRedScore;
      blue_score = newBlueScore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('صباحو تحدي', style: TextStyle(fontSize: 40),),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/main/wall.jpg"),fit:BoxFit.cover)
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8,top: 20,right: 8,bottom: 8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(child: Text(red_score.toString(),style: TextStyle(color: Colors.white,fontSize: 40),),)
                    ),
                    Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(child: Text(blue_score.toString(),style: TextStyle(color: Colors.white,fontSize: 40),),)
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: ListView.builder(
                  itemCount: saba7o_categories.length,
                  itemBuilder: (context, index) {
                    return saba7o_square(
                      title: saba7o_categories[index]['title']!,
                      pic: saba7o_categories[index]['image']!,
                      red_score: red_score,
                      blue_score: blue_score,
                      path: saba7o_categories[index]['path']!,
                      updateScores: updateScores,
                      rules:saba7o_categories[index]['rules']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
