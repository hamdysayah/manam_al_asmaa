class NameTashkelAndNo {
  String name;
  String nameNoTashkel;

  NameTashkelAndNo({
    required this.nameNoTashkel,
    required this.name,
  });

  factory NameTashkelAndNo.fromMap(data) {
    return NameTashkelAndNo(
      name: data['name'],
      nameNoTashkel: data['nameNoTashkel'],
    );
  }
}
