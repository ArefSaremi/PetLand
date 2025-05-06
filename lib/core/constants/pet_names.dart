class Animal {
  final String name;

  const Animal._(this.name);

  static const Animal cat = Animal._('Cats');
  static const Animal dog = Animal._('Dogs');
  static const Animal bird = Animal._('Birds');

  String get value => name;
}
