import 'package:flutter/material.dart';

class labesSa7bak extends StatefulWidget {

  final int redScore;
  final int blueScore;


   labesSa7bak({required this.redScore, required this.blueScore});

  @override
  State<labesSa7bak> createState() => _labesSa7bakState();
}

class _labesSa7bakState extends State<labesSa7bak> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(child: Text("labes sa7bak"))
    );
  }
}

