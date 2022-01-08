import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gaia_map_random/widgets/faction_tile.dart';
import 'package:gaia_map_random/models/faction.dart';
import 'package:flutter/services.dart';
import 'package:gaia_map_random/widgets/custom_drawer.dart';
import 'package:gaia_map_random/enums.dart';

class RandomizeFactionScreen extends StatefulWidget {
  @override
  _RandomizeFactionScreenState createState() => _RandomizeFactionScreenState();
}

class _RandomizeFactionScreenState extends State<RandomizeFactionScreen> {
  final key = GlobalKey<AnimatedListState>();

  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  List<DropdownMenuItem> dropDownitems = [
    DropdownMenuItem(
      child: Text('2'),
      value: 2,
    ),
    DropdownMenuItem(
      child: Text('3'),
      value: 3,
    ),
    DropdownMenuItem(
      child: Text('4'),
      value: 4,
    )
  ];

  List factions = ['Taklons'];

  int playerCount = 2;
  int dropDownValue = 2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/wallpaper.png'), fit: BoxFit.cover),
          ),
        ),
        Scaffold(
          drawerScrimColor: Colors.white.withOpacity(0.4),
          drawer: CustomDrawer(),
          backgroundColor: Colors.transparent,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              randomizeFactions();
            },
            label: Text(
              'Summon RNGesus!',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            backgroundColor: Colors.blueGrey.shade700,
          ),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.blueGrey.shade700,
            centerTitle: true,
            title: Text(
              'Randomize Factions',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Player Count',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  SizedBox(
                    width: 10,
                  ),
                  DropdownButton(
                    items: dropDownitems,
                    value: dropDownValue,
                    onChanged: (newValue) {
                      setState(() {
                        if (factions.length == 1) {
                          randomizeFactions();
                        } else if (factions.length < newValue) {
                          addNewPlayer(newValue - factions.length);
                        } else if (factions.length > newValue) {
                          removePlayer(factions.length - newValue);
                        }
                        dropDownValue = newValue;
                        playerCount = newValue;
                      });
                    },
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    iconEnabledColor: Colors.white,
                    dropdownColor: Colors.blueGrey.shade700,
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              factions.isEmpty
                  ? Container()
                  : Expanded(
                      child: AnimatedList(
                        key: key,
                        initialItemCount: factions.length,
                        itemBuilder: (context, index, animation) =>
                            buildItem(factions[index], index, animation),
                      ),
                    )
            ],
          ),
        )
      ],
    );
  }

  void addNewPlayer(int addedPlayerCount) {
    Random newPlayerRandom = Random();

    Map<int, Faction> factionNameBase = {
      0: Faction(name: 'Taklons'),
      1: Faction(name: 'Ambas'),
      2: Faction(name: 'Nevlas'),
      3: Faction(name: 'Itars'),
      4: Faction(name: 'Terrans'),
      5: Faction(name: 'Lantids'),
      6: Faction(name: 'Gleens'),
      7: Faction(name: 'Xenos'),
      8: Faction(name: 'Geodens'),
      9: Faction(name: 'Baltaks'),
      10: Faction(name: 'Bescods'),
      11: Faction(name: 'Firaks'),
      12: Faction(name: 'Ivits'),
      13: Faction(name: 'Hadsch Hallas')
    };

    for (int i = 0; i < addedPlayerCount; i++) {
      int r = newPlayerRandom.nextInt(14);

      while (factions.contains(factionNameBase[r].name) ||
          factions.contains(factionNameBase[r].getSameType())) {
        r = newPlayerRandom.nextInt(14);
      }

      factions.add(factionNameBase[r].name);

      key.currentState.insertItem(i);
    }
  }

  void removePlayer(int removedPlayerCount) {
    for (int j = removedPlayerCount - 1; j >= 0; j--) {
      final item = factions.last;

      key.currentState.removeItem(
        factions.length - 1,
        (context, animation) => buildItem(item, factions.length - 1, animation),
      );
      factions.removeLast();
    }
  }

  void randomizeFactions() {
    Random random = Random();

    for (int j = factions.length - 1; j >= 0; j--) {
      final item = factions.removeAt(j);

      key.currentState.removeItem(
        j,
        (context, animation) => buildItem(item, j, animation),
      );
    }
    factions.clear();

    Map<int, Faction> factionNameBase = {
      0: Faction(name: 'Taklons'),
      1: Faction(name: 'Ambas'),
      2: Faction(name: 'Nevlas'),
      3: Faction(name: 'Itars'),
      4: Faction(name: 'Terrans'),
      5: Faction(name: 'Lantids'),
      6: Faction(name: 'Gleens'),
      7: Faction(name: 'Xenos'),
      8: Faction(name: 'Geodens'),
      9: Faction(name: 'Baltaks'),
      10: Faction(name: 'Bescods'),
      11: Faction(name: 'Firaks'),
      12: Faction(name: 'Ivits'),
      13: Faction(name: 'Hadsch Hallas')
    };

    for (int i = 0; i < playerCount; i++) {
      int r = random.nextInt(14);

      while (factions.contains(factionNameBase[r].name) ||
          factions.contains(factionNameBase[r].getSameType())) {
        r = random.nextInt(14);
      }

      factions.add(factionNameBase[r].name);

      key.currentState.insertItem(i);
    }
  }

  buildItem(faction, int index, Animation<double> animation) {
    return FactionTile(
      factionName: factions[index],
      playerNo: index + 1,
      animation: animation,
    );
  }
}

// ListView.builder(
// shrinkWrap: true,
// scrollDirection: Axis.vertical,
// itemCount: factions.length,
// itemBuilder: (context, index) {
// return FactionTile(
// factionName: factions[index],
// playerNo: index + 1,
// );
// },
// )
