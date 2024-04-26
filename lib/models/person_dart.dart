class Person {
  String? name;
  String? surname;
  String? bio;
  String? parti;
  String? profil;
  Person? spouse;

  Person({this.name, this.surname, this.bio, this.parti});

  @override
  String toString() {
    return 'Person{name: $name, surname: $surname, birthDate: $bio, sex: $parti}';
  }
}
