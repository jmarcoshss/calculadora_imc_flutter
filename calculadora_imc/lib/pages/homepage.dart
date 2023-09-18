import 'package:calculadora_imc/components/card_component.dart';
import 'package:calculadora_imc/model/person.dart';
import 'package:calculadora_imc/repositories/person_repository.dart';
import 'package:calculadora_imc/widgets/text_padding.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var nameController = TextEditingController();

  var weightController = TextEditingController();

  var heightController = TextEditingController();

  var personRepository = PersonRepository();

  var _persons = <Person>[];

  @override
  void initState() {
    super.initState();
    _persons = personRepository.personsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          nameController.text = '';
          weightController.text = '';
          heightController.text = '';
          showDialog(
              context: context,
              builder: (BuildContext bc) {
                return AlertDialog(
                  title: const Text('Digite as informações'),
                  content: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const TextPadding(texto: 'Nome'),
                          TextField(
                            controller: nameController,
                          ),
                          const TextPadding(texto: 'Peso'),
                          TextField(
                            controller: weightController,
                            keyboardType: TextInputType.number,
                          ),
                          const TextPadding(texto: 'Altura'),
                          TextField(
                            controller: heightController,
                            keyboardType: TextInputType.number,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                try {
                                  double result = (double.parse(
                                          weightController.text) /
                                      (double.parse(heightController.text) *
                                          double.parse(heightController.text)));
                                  if (nameController.text == ''){
                                      ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      duration: Duration(seconds: 3),
                                      content: Text(
                                          'Por favor digite seu nome'),
                                    ),
                                  );
                                  }else {
                                    personRepository.addPerson(Person(
                                      nameController.text,
                                      double.parse(weightController.text),
                                      double.parse(heightController.text),
                                      result));
                                  }
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      duration: Duration(seconds: 3),
                                      content: Text(
                                          'Por favor digite um valor de peso e altura valido ("0-9", ".") '),
                                    ),
                                  );
                                }

                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: const Text('calcular'))
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('cancelar')),
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _persons.length,
          itemBuilder: (BuildContext bc, int index) {
            var person = _persons[index];
            return CardComponent(
              nameCard: person.name,
              weightCard: person.weight,
              heightCard: person.height,
              imcCard: person.imc,
            );
          },
        ),
      ),
    );
  }
}
