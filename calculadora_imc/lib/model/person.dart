


class Person {
  String _name = "";
  double _weight = 0.0;
  double _height = 0.0;
  double _imc = 0.0;
  Person(
    this._name,
    this._weight,
    this._height,
    this._imc,
  );

  String get name => _name;
  double get weight => _weight;
  double get height => _height;
  double get imc => _imc;

  set name(String name){
    _name = name;
  }
  set weight(double weight){
    _weight = weight;
  }
  set height(double height){
    _height = height;
  }
  set imc(double imc){
    _imc = imc;
  }
  
}
