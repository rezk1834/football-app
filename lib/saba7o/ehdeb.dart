import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../database/database.dart';

class Ehbed extends StatefulWidget {
  final int redScore;
  final int blueScore;

  Ehbed({required this.redScore, required this.blueScore});

  @override
  State<Ehbed> createState() => _EhbedState();
}

class _EhbedState extends State<Ehbed> {
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

  void correctAnswer() {
    setState(() {

    });
  }

  void draw() {
    setState(() {
      if (questionsNumber < 5) {
        questionsNumber++;
        gameRedScore++;
        gameBlueScore++;
      }
      if (questionsNumber == 5) {
        _checkGameEnd();
      }
    });
  }

  void reddouble() {
    setState(() {
      if (questionsNumber < 5) {
        questionsNumber++;
        gameRedScore += 2;
      }
      if (questionsNumber == 5) {
        _checkGameEnd();
      }
    });
  }

  void bluedouble() {
    setState(() {
      if (questionsNumber < 5) {
        questionsNumber++;
        gameBlueScore += 2;
      }
      if (questionsNumber == 5) {
        _checkGameEnd();
      }
    });
  }

  void _checkGameEnd() {
    if (questionsNumber == 5) {
      if (gameRedScore > gameBlueScore) {
        redScore++;
      } else if (gameRedScore < gameBlueScore) {
        blueScore++;
      }
      Navigator.pop(context, [redScore, blueScore]);
    }
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
    List<int> randomNumbers = generateUniqueRandomNumbers(5, Ehbed_data.length);

    return Scaffold(
      appBar: AppBar(
        title: Text('Ehbed Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: Column(
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
                              if (questionsNumber < 5) {
                                gameRedScore++;
                                questionsNumber++;
                              }
                              if (questionsNumber == 5) {
                                _checkGameEnd();
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
                              if (questionsNumber < 5) {
                                gameBlueScore++;
                                questionsNumber++;
                              }
                              if (questionsNumber == 5) {
                                _checkGameEnd();
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (questionsNumber < 5)
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
                      Ehbed_data[randomNumbers[questionsNumber]]['question'] as String,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              if (questionsNumber < 5)
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    Ehbed_data[randomNumbers[questionsNumber]]['answer'].toString(),
                    style: TextStyle(fontSize: 40, color: Colors.green),
                  ),
                ),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: draw,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blueGrey,
                        ),
                        child: Text('Draw'),
                      ),
                      ElevatedButton(
                        onPressed: correctAnswer,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green,
                        ),
                        child: Text('Change the question'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: reddouble,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                        ),
                        child: Text('Red double points'),
                      ),
                      ElevatedButton(
                        onPressed: bluedouble,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                        ),
                        child: Text('Blue double points'),
                      ),
                    ],
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
