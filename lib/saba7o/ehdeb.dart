import 'package:flutter/material.dart';

class ehbed extends StatefulWidget {
  final int redScore;
  final int blueScore;

  const ehbed({required this.redScore, required this.blueScore});

  @override
  State<ehbed> createState() => _ehbedState();
}

class _ehbedState extends State<ehbed> {
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
            Text('Red Score: ${widget.redScore}'),
            Text('Blue Score: ${widget.blueScore}'),
          ],
        ),
      ),
    );
  }
}
