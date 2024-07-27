import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../database/database.dart';

class Ekdeb extends StatefulWidget {
  final int redScore;
  final int blueScore;

  Ekdeb({required this.redScore, required this.blueScore});

  @override
  State<Ekdeb> createState() => _EkdebState();
}

class _EkdebState extends State<Ekdeb> {
  late int redScore;
  late int blueScore;
  int gameBlueScore = 0;
  int gameRedScore = 0;
  int questionsNumber = 0;
  Random random = Random();
  late List<int> randomNumbers;

  @override
  void initState() {
    super.initState();
    redScore = widget.redScore;
    blueScore = widget.blueScore;
    randomNumbers = generateUniqueRandomNumbers(5, Acting_data.length);
  }

  List<int> generateUniqueRandomNumbers(int count, int max) {
    Set<int> uniqueNumbers = Set<int>();

    while (uniqueNumbers.length < count) {
      int number = random.nextInt(max);
      uniqueNumbers.add(number);
    }

    return uniqueNumbers.toList();
  }

  void draw() {
    setState(() {
      questionsNumber++;
      _checkGameEnd();
    });
  }

  void changeQuestion() {
    setState(() {
      _checkGameEnd();
      randomNumbers[questionsNumber] = random.nextInt(Ekdeb_data.length);
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
    if (gameBlueScore == 3) {
      blueScore++;
      Navigator.pop(context, [redScore, blueScore]);
    }
    if (gameRedScore == 3) {
      redScore++;
      Navigator.pop(context, [redScore, blueScore]);
    }
  }
  @override
  Widget build(BuildContext context) {
    List<int> randomNumbers = generateUniqueRandomNumbers(5, Ekdeb_data.length);

    return Scaffold(
      appBar: AppBar(
        title: Text('Ekdeb Page'),
        centerTitle: true,
      ),
      body: Padding(
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
                              questionsNumber++;
                              _checkGameEnd();
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
                              _checkGameEnd();
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
                    Ekdeb_data[randomNumbers[questionsNumber]]['question'] as String,
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
                  Ekdeb_data[randomNumbers[questionsNumber]]['answer'].toString(),
                  style: TextStyle(fontSize: 40, color: Colors.green),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: draw,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueGrey,
                    ),
                    child: Text('No Answer'),
                  ),
                  ElevatedButton(
                    onPressed: changeQuestion,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                    child: Text('Change the question'),
                  ),
                ],
              ),
            ],
          )
      ),
    );
  }
}
