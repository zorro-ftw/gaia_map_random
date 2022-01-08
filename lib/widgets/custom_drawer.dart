import 'package:flutter/material.dart';
import 'package:gaia_map_random/screens/randomize_faction_screen.dart';
import 'package:gaia_map_random/screens/randomize_map_screen.dart';

class CustomDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color(0xFF334d62),
        child: ListView(
          padding: padding,
          children: [
            SizedBox(
              height: 48,
            ),
            buildMenuItem(
                context: context,
                title: 'Map Randomer',
                icon: Icons.map,
                pageToGo: RandomizeMapScreen()),
            SizedBox(
              height: 16,
            ),
            buildMenuItem(
                context: context,
                title: 'Faction Randomer',
                icon: Icons.flag,
                pageToGo: RandomizeFactionScreen())
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(
      {String title, IconData icon, Widget pageToGo, BuildContext context}) {
    final color = Colors.white;
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        title,
        style: TextStyle(color: color),
      ),
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) {
            return pageToGo;
          }),
        );
      },
    );
  }
}
