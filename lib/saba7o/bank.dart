import 'package:flutter/material.dart';

class Bank extends StatefulWidget {

  final int redScore;
  final int blueScore;


  Bank({required this.redScore, required this.blueScore});

  @override
  State<Bank> createState() => _BankState();
}

class _BankState extends State<Bank> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(child: Text("Bank"))
    );
  }
}

