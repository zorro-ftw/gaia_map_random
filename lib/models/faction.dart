class Faction {
  Faction({this.name});
  final String name;

  String getSameType() {
    switch (name) {
      case 'Ambas':
        {
          return 'Taklons';
        }
      case 'Taklons':
        {
          return 'Ambas';
        }
      case 'Gleens':
        {
          return 'Xenos';
        }
      case 'Xenos':
        {
          return 'Gleens';
        }
      case 'Baltaks':
        {
          return 'Geodens';
        }
      case 'Geodens':
        {
          return 'Baltaks';
        }
      case 'Bescods':
        {
          return 'Firaks';
        }
      case 'Firaks':
        {
          return 'Bescods';
        }
      case 'Hadsch Hallas':
        {
          return 'Ivits';
        }
      case 'Ivits':
        {
          return 'Hadsch Hallas';
        }
      case 'Nevlas':
        {
          return 'Itars';
        }
      case 'Itars':
        {
          return 'Nevlas';
        }
      case 'Terrans':
        {
          return 'Lantids';
        }
      case 'Lantids':
        {
          return 'Terrans';
        }
    }
  }
}
