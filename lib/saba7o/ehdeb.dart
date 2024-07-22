import 'dart:math';
import 'package:flutter/material.dart';
import '../database/database.dart';

class ehbed extends StatefulWidget {
  final int redScore;
  final int blueScore;

  ehbed({required this.redScore, required this.blueScore});

  @override
  State<ehbed> createState() => _ehbedState();
}

class _ehbedState extends State<ehbed> {
  late int redScore;
  late int blueScore;
  late int gameBlueScore = 0;
  late int gameRedScore = 0;
  int questionsNumbers = 3; 
  Random random = Random();

  @override
  void initState() {
    super.initState();
    redScore = widget.redScore;
    blueScore = widget.blueScore;
  }

  List<int> generateUniqueRandomNumbers(int count, int max) {
    Set<int> uniqueNumbers = Set<int>();

    while (uniqueNumbers.length < count) {
      int number = random.nextInt(max);
      uniqueNumbers.add(number);
    }

    return uniqueNumbers.toList();
  }

  @override
  Widget build(BuildContext context) {
    List<int> randomNumbers = generateUniqueRandomNumbers(questionsNumbers, ehbed_data.length);

    return Scaffold(
      appBar: AppBar(
        title: Text('ehbed Page'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/main/wall.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          gameRedScore.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    DropdownButton<int>(
                      value: questionsNumbers,
                      items: [3, 5, 7, 9]
                          .map((int value) => DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      ))
                          .toList(),
                      onChanged: (int? value) {
                        if (value != null) {
                          setState(() {
                            questionsNumbers = value;
                          });
                        }
                      },
                    ),

                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          gameBlueScore.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              setState(() {
                redScore++;
              });
              Navigator.pop(context, [redScore, blueScore]);
            },
            child: Icon(Icons.add, color: Colors.white),
          ),
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              setState(() {
                blueScore++;
              });
              Navigator.pop(context, [redScore, blueScore]);
            },
            child: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
