class Person {
  int _id = 0;
  String _name = "";
  double _weight = 0.0;
  double _height = 0.0;
  double _imc = 0.0;
  Person(
    this._id,
    this._name,
    this._weight,
    this._height,
    this._imc,
  );

  int get id => _id;
  String get name => _name;
  double get weight => _weight;
  double get height => _height;
  double get imc => _imc;

  set id(int id) {
    _id = id;
  }

  set name(String name) {
    _name = name;
  }

  set weight(double weight) {
    _weight = weight;
  }

  set height(double height) {
    _height = height;
  }

  set imc(double imc) {
    _imc = imc;
  }
}
