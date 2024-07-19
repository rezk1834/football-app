import 'package:flutter/material.dart';

class saba7o_square extends StatefulWidget {
  final String child;
  final String pic;
  final int red_score;
  final int blue_score;
  final String path;


  saba7o_square({super.key, required this.child, required this.pic, required this.red_score, required this.blue_score, required this.path});

  @override
  State<saba7o_square> createState() => _saba7o_squareState();
}

class _saba7o_squareState extends State<saba7o_square> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, widget.path);
        },
        child: Container(
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              image: AssetImage(widget.pic),
              fit: BoxFit.fill,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                right: 10,
                bottom: 10,
                child: Text(
                  widget.child,
                  style: TextStyle(fontSize: 45, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
