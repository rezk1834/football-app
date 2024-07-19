import 'package:flutter/material.dart';
import '../saba7o/ehdeb.dart';
import '../saba7o/ekdeb.dart';

class saba7o_square extends StatefulWidget {
  final String title;
  final String pic;
  final int red_score;
  final int blue_score;
  final String path;
  final String rules;
  final Function(int, int) updateScores;

  saba7o_square({
    super.key,
    required this.title,
    required this.pic,
    required this.red_score,
    required this.blue_score,
    required this.path,
    required this.rules,
    required this.updateScores,
  });

  @override
  State<saba7o_square> createState() => _saba7o_squareState();
}

class _saba7o_squareState extends State<saba7o_square> {
  Future<void> _navigateToPage(BuildContext context) async {
    final newScores = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          switch (widget.path) {
            case '/ehbed':
              return ehbed(redScore: widget.red_score, blueScore: widget.blue_score);
            case '/ekdeb':
              return ekdeb(redScore: widget.red_score, blueScore: widget.blue_score);
            default:
              return Container(); // Placeholder for invalid path
          }
        },
      ),
    );

    if (newScores != null && newScores is List<int> && newScores.length == 2) {
      widget.updateScores(newScores[0], newScores[1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Generate a unique tag for the hero animation
    final heroTag = 'hero_${widget.title}_${widget.path}';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () async {
          await _navigateToPage(context);
        },
        child: Hero(
          tag: heroTag, // Use a unique tag for the Hero widget
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
                  top: 5,
                  child: GestureDetector(
                    onTap: () {
                      showAboutDialog(
                        context: context,
                        applicationIcon: Icon(Icons.info),
                        applicationName: 'Game Rules',
                        applicationVersion: widget.rules,
                      );
                    },
                    child: Icon(Icons.info),
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Text(
                    widget.title,
                    style: TextStyle(fontSize: 45, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
