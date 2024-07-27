import 'dart:math';
import 'package:flutter/material.dart';
import '../components/drawingpage.dart';
import '../database/database.dart';


class Draw extends StatefulWidget {
  final int redScore;
  final int blueScore;

  Draw({required this.redScore, required this.blueScore});

  @override
  State<Draw> createState() => _DrawState();
}

class _DrawState extends State<Draw> {
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
    randomNumbers = generateUniqueRandomNumbers(8, Draw_data.length);
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
      if (questionsNumber == 8) {
        if (gameRedScore > gameBlueScore) {
          redScore++;
          Navigator.pop(context, [redScore, blueScore]);
        } else if (gameRedScore < gameBlueScore) {
          blueScore++;
          Navigator.pop(context, [redScore, blueScore]);
        } else {
          redScore++;
          blueScore++;
          Navigator.pop(context, [redScore, blueScore]);
        }
      }
    });
  }

  void changeQuestion() {
    setState(() {
      randomNumbers[questionsNumber] = random.nextInt(Draw_data.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draw Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
            SizedBox(height: 10),
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
                  Draw_data[randomNumbers[questionsNumber]]['name'] as String,
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            Image(image: AssetImage("assets/main/img.png")),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: changeQuestion,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                  ),
                  child: Text('Change the question'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DrawingPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueGrey,
                  ),
                  child: Text('Drawing Page'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
