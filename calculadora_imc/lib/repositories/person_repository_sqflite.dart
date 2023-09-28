import 'package:calculadora_imc/database/imc_calculator_database.dart';
import 'package:calculadora_imc/model/person.dart';

class PersonRepositorySqflite {
  Future<List<Person>> getPersoDatabase() async {
    List<Person> persons = [];
    var db = await ImcCalculatorDataBase().obterDataBase();
    var result = await db.rawQuery('SELECT id, name, weight, height, imc FROM persons');
    for (var element in result) {
      persons.add(
        Person(
          int.parse(element['id'].toString()),
          element['name'].toString(),
          double.parse(element['weight'].toString()),
          double.parse(element['height'].toString()),
          double.parse(element['imc'].toString()),
        ),
      );
    }
    return persons;
  }

  Future<void> save(Person person) async {
    var db = await ImcCalculatorDataBase().obterDataBase();
    await db.rawInsert(
        'INSERT INTO persons(name, weight, height, imc) values(?,?,?,?)',
        [person.name, person.weight, person.height, person.imc]);
  }
  Future<void> remove(int id) async {
    var db = await ImcCalculatorDataBase().obterDataBase();
    await db.rawInsert(
        'DELETE FROM persons WHERE id = ?',
        [id]);
  }
}
