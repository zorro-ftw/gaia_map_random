import 'package:flutter/material.dart';
import 'package:gaia_map_random/enums.dart';

class FactionTile extends StatelessWidget {
  FactionTile({this.factionName, this.playerNo, this.animation});
  final String factionName;
  final int playerNo;
  final Animation animation;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0, left: 17, right: 17),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade700.withOpacity(0.6),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                'P$playerNo',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('images/$factionName.png'),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                factionName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 29,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//
// Tween<Offset>(
// begin: const Offset(-1, 0),
// end: Offset(0, 0),
// ).animate(animation)

// Image.asset(
// 'images/$factionName.png',
// height: 85,
// width: 85,
// ),
