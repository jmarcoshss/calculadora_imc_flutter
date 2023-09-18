
import 'package:calculadora_imc/model/person.dart';

class PersonRepository {
  final List<Person> _persons = [] ;

  void addPerson (Person person){
    _persons.add(person);
  }

  List<Person> personsList(){
    return _persons;
  } 
}