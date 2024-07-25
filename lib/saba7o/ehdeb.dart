import 'dart:math';
import 'package:flutter/cupertino.dart';
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
  int gameBlueScore = 0;
  int gameRedScore = 0;
  int questionsNumber = 0;
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
    List<int> randomNumbers = generateUniqueRandomNumbers(5, ehbed_data.length);

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
          child: (questionsNumber < 5)
              ? Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
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
                        IconButton(
                          icon: Icon(Icons.add, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              gameRedScore++;
                              questionsNumber++;
                            });
                          },
                        ),
                      ],
                    ),
                    Text(
                      'Question No.${questionsNumber + 1}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Column(
                      children: [
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
                        IconButton(
                          icon: Icon(Icons.add, color: Colors.blue),
                          onPressed: () {
                            setState(() {
                              gameBlueScore++;
                              questionsNumber++;

                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Text(
                    ehbed_data[randomNumbers[questionsNumber]]['question'] as String,
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  ehbed_data[randomNumbers[questionsNumber]]['answer'].toString(),
                  style: TextStyle(fontSize: 40, color: Colors.green),
                ),
              ),
            ],
          )
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 125,
                child: FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () {
                    setState(() {
                      redScore++;
                    });
                    Navigator.pop(context, [redScore, blueScore]);
                  },
                  child: Text('Team Red won', style: TextStyle(color: Colors.white, fontSize: 15)),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 125,
                child: FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: () {
                    setState(() {
                      blueScore++;
                    });
                    Navigator.pop(context, [redScore, blueScore]);
                  },
                  child: Text('Team Blue won', style: TextStyle(color: Colors.white, fontSize: 15)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
