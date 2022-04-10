import 'package:gaia_map_random/enums.dart';
import 'package:gaia_map_random/widgets/custom_drawer.dart';
import '../widgets/sector_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class RandomizeMapScreen extends StatefulWidget {
  @override
  _RandomizeMapScreenState createState() => _RandomizeMapScreenState();
}

class _RandomizeMapScreenState extends State<RandomizeMapScreen> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    super.initState();
  }

  TransformationController controller = TransformationController();

  List<Image> row1 = [];

  List<Image> row2 = [];

  List<Image> row3 = [];

  List<Widget> finalDisplay = [
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/wallpaper2.png'), fit: BoxFit.fill),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.white.withOpacity(0.4),
      drawer: CustomDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          randomize();
          displayResults();
        },
        label: Text(
          'Summon RNGesus!',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: Color(0xFF223C5F),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF223C5F),
        centerTitle: true,
        title: Text(
          'Gaia Map Random',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GestureDetector(
        onDoubleTap: _handleDoubleTap,
        child: InteractiveViewer(
          transformationController: controller,
          constrained: false,
          // boundaryMargin: EdgeInsets.all(20),
          minScale: 1,
          maxScale: 3,
          clipBehavior: Clip.none,
          child: Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width, maxHeight: 500),
            child: Stack(
                fit: StackFit.loose,
                clipBehavior: Clip.none,
                children: finalDisplay),
          ),
        ),
      ),
    );
  }

  void _handleDoubleTap() {
    if (controller.value != Matrix4.identity()) {
      controller.value = Matrix4.identity();
    }
  }

  void displayResults() {
    List<Widget> dummyRow1 = [];
    List<Widget> dummyRow2 = [];
    List<Widget> dummyRow3 = [];
    List<Widget> dummyResult = [];
    for (int i = 0; i < row1.length; i++) {
      dummyRow1.add(
          Positioned(left: 162.0 + i * 133.0, top: i * 15.0, child: row1[i]));
    }
    for (int i = 0; i < row2.length; i++) {
      dummyRow2.add(Positioned(
          left: 81.0 + i * 133.0, top: 108.0 + i * 15.0, child: row2[i]));
    }
    for (int i = 0; i < row3.length; i++) {
      dummyRow3.add(Positioned(
          left: 133.0 + i * 133.0, top: 232 + i * 15.0, child: row3[i]));
    }
    if (row1.isNotEmpty && row2.isNotEmpty && row3.isNotEmpty) {
      for (int d = 0; d < 10; d++) {
        if (d < 3) {
          dummyResult.add(dummyRow1[d]);
        } else if (2 < d && d < 7) {
          dummyResult.add(dummyRow2[d - 3]);
        } else {
          dummyResult.add(dummyRow3[d - 7]);
        }
      }
    }

    setState(() {
      finalDisplay.addAll(dummyResult);
    });
  }

  void randomize() {
    row1.clear();
    row2.clear();
    row3.clear();
    bool isSuitable = false;
    List<int> randomSectorNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    List<int> rotations = [];
    List<SectorTile> allTiles = [];

    var random = Random();
    while (!isSuitable) {
      allTiles.clear();
      rotations.clear();
      randomSectorNumbers.shuffle(random);
      for (int i = 0; i < 10; i++) {
        rotations.add(random.nextInt(6));
        allTiles.add(SectorTile(
            sectorNumber: randomSectorNumbers[i], rotation: rotations[i]));
      }

      for (int k = 0; k < allTiles.length; k++) {
        switch (k) {
          case 0:
          case 1:
          case 4:
          case 5:
            {
              isSuitable = checkPlanets([
                Side.BottomLeft,
                Side.BottomRight,
                Side.Right
              ], [
                allTiles[k],
                allTiles[k + 3],
                allTiles[k + 4],
                allTiles[k + 1]
              ]);
              break;
            }
          case 2:
            {
              isSuitable = checkPlanets([Side.BottomLeft, Side.BottomRight],
                  [allTiles[k], allTiles[k + 3], allTiles[k + 4]]);
              break;
            }
          case 3:
            {
              isSuitable = checkPlanets([Side.BottomRight, Side.Right],
                  [allTiles[k], allTiles[k + 4], allTiles[k + 1]]);
              break;
            }
          case 6:
            {
              isSuitable = checkPlanets(
                  [Side.BottomLeft], [allTiles[k], allTiles[k + 3]]);
              break;
            }
          case 7:
          case 8:
            {
              isSuitable =
                  checkPlanets([Side.Right], [allTiles[k], allTiles[k + 1]]);
              break;
            }
          case 9:
            {
              break;
            }
        }
        if (!isSuitable) {
          break;
        }
      }
    }
    for (int j = 0; j < randomSectorNumbers.length; j++) {
      if (j < 3) {
        row1.add(Image(
          image: AssetImage(
              'images/O${randomSectorNumbers[j]}-${rotations[j] * 60}.png'),
          width: 150,
          height: 150,
        ));
      } else if (j >= 3 && j < 7) {
        row2.add(Image(
          image: AssetImage(
              'images/O${randomSectorNumbers[j]}-${rotations[j] * 60}.png'),
          width: 150,
          height: 150,
        ));
      } else if (j >= 7 && j < 10) {
        row3.add(Image(
          image: AssetImage(
              'images/O${randomSectorNumbers[j]}-${rotations[j] * 60}.png'),
          width: 150,
          height: 150,
        ));
      }
    }
  }

  // A function to check neighbor planets to see if they are suitable
  bool checkPlanets(List<Side> fullSides, List<SectorTile> tiles) {
    // First item of "tiles" should be the main tile, followed by all neighbors in clockwise direction
    bool isOkMain = true;
    for (int i = 0; i < fullSides.length; i++) {
      List<Planet> dummyMain = [];
      List<Planet> dummyNeighbor = [];
      switch (fullSides[i]) {
        case Side.BottomLeft:
          {
            dummyMain = List.from(tiles[0].getOneSidePlanets(4).reversed);
            dummyNeighbor = tiles[i + 1].getOneSidePlanets(1);
            isOkMain = crossCheckOneSide(dummyMain, dummyNeighbor);
            break;
          }
        case Side.BottomRight:
          {
            dummyMain = List.from(tiles[0].getOneSidePlanets(3).reversed);
            dummyNeighbor = tiles[i + 1].getOneSidePlanets(6);
            isOkMain = crossCheckOneSide(dummyMain, dummyNeighbor);
            break;
          }
        case Side.Right:
          {
            dummyMain = List.from(tiles[0].getOneSidePlanets(2).reversed);
            dummyNeighbor = tiles[i + 1].getOneSidePlanets(5);
            isOkMain = crossCheckOneSide(dummyMain, dummyNeighbor);
            break;
          }
      }
      if (!isOkMain) {
        break;
      }
    }
    return isOkMain;
  }

  // A function to cross check planets of neighbor tiles at one edge
  bool crossCheckOneSide(List<Planet> mainTile, List<Planet> neighborTile) {
    bool isOk = true;

    for (int j = 0; j < 3; j++) {
      switch (j) {
        case 0: // Nothing written here because case 0 & 1 require same action
        case 1:
          {
            if (mainTile[j] != Planet.Empty) {
              if (mainTile[j] == neighborTile[j] ||
                  mainTile[j] == neighborTile[j + 1]) {
                isOk = false;
              }
            }
            break;
          }
        case 2:
          {
            if (mainTile[j] != Planet.Empty) {
              if (mainTile[j] == neighborTile[j]) {
                isOk = false;
              }
            }
            break;
          }
      }
      if (!isOk) {
        break; // If current condition is not OK, break the for loop and return the result
      }
    }

    return isOk;
  }
}
