import 'package:flutter/material.dart';

class Mazad extends StatefulWidget {

  final int redScore;
  final int blueScore;


  Mazad({required this.redScore, required this.blueScore});

  @override
  State<Mazad> createState() => _MazadState();
}

class _MazadState extends State<Mazad> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(child: Text("Mazad"))
    );
  }
}

