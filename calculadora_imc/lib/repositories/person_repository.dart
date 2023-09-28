
import 'package:calculadora_imc/model/person.dart';

class PersonRepository {
  final List<Person> _persons = [] ;

  void addPerson (Person person){
    _persons.add(person);
  }

  List<Person> personsList(){
    return _persons;
  } 
  void remove (int id){
    _persons.remove(_persons.where((person) => person.id == id).first);
  }
}