import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../database/database.dart';

class Whisper extends StatefulWidget {
  final int redScore;
  final int blueScore;

  Whisper({required this.redScore, required this.blueScore});

  @override
  State<Whisper> createState() => _WhisperState();
}

class _WhisperState extends State<Whisper> {
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
    List<int> randomNumbers = generateUniqueRandomNumbers(8, Whisper_data.length);

    return Scaffold(
      appBar: AppBar(
        title: Text('Whisper Page'),
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
            child:  Column(
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
                                if (gameRedScore == 4 && gameBlueScore == 4) {
                                  redScore++;
                                  blueScore++;
                                  Navigator.pop(context, [redScore, blueScore]);
                                }

                                if (gameRedScore == 5) {
                                  redScore++;
                                  Navigator.pop(context, [redScore, blueScore]);
                                } else {
                                  questionsNumber++;
                                }
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
                                if (gameRedScore == 4 && gameBlueScore == 4) {
                                  redScore++;
                                  blueScore++;
                                  Navigator.pop(context, [redScore, blueScore]);
                                }
                                if (gameBlueScore == 5) {
                                  blueScore++;
                                  Navigator.pop(context, [redScore, blueScore]);
                                } else {
                                  questionsNumber++;
                                }
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
                      Whisper_data[randomNumbers[questionsNumber]]['name'] as String,
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),

              ],
            )
        ),
      ),
    );
  }
}
