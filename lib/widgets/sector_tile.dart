import '../enums.dart';

class SectorTile {
  int sectorNumber;
  int rotation;
  List<int> closedSides;

  SectorTile({this.sectorNumber, this.rotation});

  List<Planet> getPlanetList() {
    List<Planet> sector = [];

    switch (sectorNumber) {
      case 1:
        {
          sector.insert(0, Planet.Empty);
          sector.insert(1, Planet.Empty);
          sector.insert(2, Planet.Empty);
          sector.insert(3, Planet.Gaia);
          sector.insert(4, Planet.Empty);
          sector.insert(5, Planet.Volcanic);
          sector.insert(6, Planet.Oxide);
          sector.insert(7, Planet.Empty);
          sector.insert(8, Planet.Empty);
          sector.insert(9, Planet.Desert);
          sector.insert(10, Planet.Empty);
          sector.insert(11, Planet.Empty);
          break;
        }
      case 2:
        {
          sector.insert(0, Planet.Titanium);
          sector.insert(1, Planet.Empty);
          sector.insert(2, Planet.Empty);
          sector.insert(3, Planet.Desert);
          sector.insert(4, Planet.Empty);
          sector.insert(5, Planet.Gaia);
          sector.insert(6, Planet.Empty);
          sector.insert(7, Planet.Oxide);
          sector.insert(8, Planet.Empty);
          sector.insert(9, Planet.Empty);
          sector.insert(10, Planet.Empty);
          sector.insert(11, Planet.Volcanic);
          break;
        }
      case 3:
        {
          sector.insert(0, Planet.Gaia);
          sector.insert(1, Planet.Empty);
          sector.insert(2, Planet.Empty);
          sector.insert(3, Planet.Titanium);
          sector.insert(4, Planet.Empty);
          sector.insert(5, Planet.Empty);
          sector.insert(6, Planet.Desert);
          sector.insert(7, Planet.Terra);
          sector.insert(8, Planet.Empty);
          sector.insert(9, Planet.Empty);
          sector.insert(10, Planet.Empty);
          sector.insert(11, Planet.Empty);
          break;
        }
      case 4:
        {
          sector.insert(0, Planet.Titanium);
          sector.insert(1, Planet.Empty);
          sector.insert(2, Planet.Empty);
          sector.insert(3, Planet.Empty);
          sector.insert(4, Planet.Terra);
          sector.insert(5, Planet.Empty);
          sector.insert(6, Planet.Empty);
          sector.insert(7, Planet.Empty);
          sector.insert(8, Planet.Empty);
          sector.insert(9, Planet.Ice);
          sector.insert(10, Planet.Empty);
          sector.insert(11, Planet.Empty);
          break;
        }
      case 5:
        {
          sector.insert(0, Planet.Ice);
          sector.insert(1, Planet.Empty);
          sector.insert(2, Planet.Gaia);
          sector.insert(3, Planet.Oxide);
          sector.insert(4, Planet.Empty);
          sector.insert(5, Planet.Empty);
          sector.insert(6, Planet.Desert);
          sector.insert(7, Planet.Volcanic);
          sector.insert(8, Planet.Empty);
          sector.insert(9, Planet.Empty);
          sector.insert(10, Planet.Empty);
          sector.insert(11, Planet.Empty);
          break;
        }
      case 6:
        {
          sector.insert(0, Planet.Empty);
          sector.insert(1, Planet.Gaia);
          sector.insert(2, Planet.Empty);
          sector.insert(3, Planet.Empty);
          sector.insert(4, Planet.Desert);
          sector.insert(5, Planet.Gaia);
          sector.insert(6, Planet.Empty);
          sector.insert(7, Planet.Empty);
          sector.insert(8, Planet.Empty);
          sector.insert(9, Planet.Empty);
          sector.insert(10, Planet.Empty);
          sector.insert(11, Planet.Empty);
          break;
        }
      case 7:
        {
          sector.insert(0, Planet.Empty);
          sector.insert(1, Planet.Swamp);
          sector.insert(2, Planet.Empty);
          sector.insert(3, Planet.Empty);
          sector.insert(4, Planet.Empty);
          sector.insert(5, Planet.Empty);
          sector.insert(6, Planet.Titanium);
          sector.insert(7, Planet.Empty);
          sector.insert(8, Planet.Empty);
          sector.insert(9, Planet.Empty);
          sector.insert(10, Planet.Gaia);
          sector.insert(11, Planet.Empty);
          break;
        }
      case 8:
        {
          sector.insert(0, Planet.Terra);
          sector.insert(1, Planet.Empty);
          sector.insert(2, Planet.Gaia);
          sector.insert(3, Planet.Empty);
          sector.insert(4, Planet.Empty);
          sector.insert(5, Planet.Empty);
          sector.insert(6, Planet.Empty);
          sector.insert(7, Planet.Gaia);
          sector.insert(8, Planet.Empty);
          sector.insert(9, Planet.Empty);
          sector.insert(10, Planet.Empty);
          sector.insert(11, Planet.Empty);
          break;
        }
      case 9:
        {
          sector.insert(0, Planet.Empty);
          sector.insert(1, Planet.Gaia);
          sector.insert(2, Planet.Ice);
          sector.insert(3, Planet.Empty);
          sector.insert(4, Planet.Empty);
          sector.insert(5, Planet.Empty);
          sector.insert(6, Planet.Empty);
          sector.insert(7, Planet.Empty);
          sector.insert(8, Planet.Swamp);
          sector.insert(9, Planet.Empty);
          sector.insert(10, Planet.Empty);
          sector.insert(11, Planet.Volcanic);
          break;
        }
      case 10:
        {
          sector.insert(0, Planet.Empty);
          sector.insert(1, Planet.Gaia);
          sector.insert(2, Planet.Gaia);
          sector.insert(3, Planet.Empty);
          sector.insert(4, Planet.Empty);
          sector.insert(5, Planet.Empty);
          sector.insert(6, Planet.Empty);
          sector.insert(7, Planet.Oxide);
          sector.insert(8, Planet.Terra);
          sector.insert(9, Planet.Empty);
          sector.insert(10, Planet.Empty);
          sector.insert(11, Planet.Empty);
          break;
        }
    }

    for (int i = 0; i < rotation; i++) {
      sector.insert(0, sector.removeAt(11));
      sector.insert(0, sector.removeAt(11));
    }
    return sector;
  }

  List<Planet> getOneSidePlanets(int side) {
    switch (side) {
      case 1:
        {
          return this.getPlanetList().sublist(0, 3);
        }
      case 2:
        {
          return this.getPlanetList().sublist(2, 5);
        }
      case 3:
        {
          return this.getPlanetList().sublist(4, 7);
        }
      case 4:
        {
          return this.getPlanetList().sublist(6, 9);
        }
      case 5:
        {
          return this.getPlanetList().sublist(8, 11);
        }
      case 6:
        {
          List<Planet> dummy = this.getPlanetList().sublist(10, 12);
          dummy.add(this.getPlanetList()[0]);
          return dummy;
        }
    }
  }
}
