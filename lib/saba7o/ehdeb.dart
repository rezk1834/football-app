import 'package:flutter/material.dart';

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
        title: Text('Ehbed Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Red Score: $redScore'),
            Text('Blue Score: $blueScore'),
          ],
        ),
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
