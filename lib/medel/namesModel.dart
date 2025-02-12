class Namesmodel {
  int id;

  Namesmodel(
      {required this.id,
      required this.name,
      required this.typeOfName,
      required this.nameWight,
      required this.domainName,
      required this.root,
      required this.origin,
      required this.meaning});

  String name;
  String typeOfName;
  String nameWight;
  String domainName;
  String root;
  String origin;
  String meaning;

  factory Namesmodel.fromMap(data) {
    return Namesmodel(
      id: data['id'],
      name: data['name'],
      typeOfName: data['typeOfName'],
      nameWight: data['nameWight'],
      domainName: data['domainName'],
      root: data['root'],
      origin: data['origin'],
      meaning: data['meaning'],
    );
  }
}
