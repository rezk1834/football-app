import 'package:flutter/material.dart';

class ekdeb extends StatefulWidget {
  final int redScore;
  final int blueScore;

  ekdeb({required this.redScore, required this.blueScore});

  @override
  State<ekdeb> createState() => _ekdebState();
}

class _ekdebState extends State<ekdeb> {
  late int redScore;
  late int blueScore;
  late int gameBlueScore = 0;
  late int gameRedScore = 0;

  @override
  void initState() {
    super.initState();
    redScore = widget.redScore;
    blueScore = widget.blueScore;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ekdeb Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
                    child: Center(child: Text(gameRedScore.toString(),style: TextStyle(color: Colors.white,fontSize: 40),),)
                ),
                Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(child: Text(gameBlueScore.toString(),style: TextStyle(color: Colors.white,fontSize: 40),),)
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                redScore++;
              });
              Navigator.pop(context, [redScore, blueScore]);
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                blueScore++;
              });
              Navigator.pop(context, [redScore, blueScore]);
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
