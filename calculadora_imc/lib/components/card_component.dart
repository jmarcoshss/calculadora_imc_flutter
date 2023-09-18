import 'package:calculadora_imc/widgets/text_padding.dart';
import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final String nameCard;
  final double weightCard;
  final double heightCard;
  final double imcCard;

  const CardComponent({
    Key? key,
    required this.nameCard,
    required this.weightCard,
    required this.heightCard,
    required this.imcCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        Row(
          children: [
            const TextPadding(texto: 'Nome:'),
            Text(nameCard),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 16.0, 8.0, 4.0),
          child: Row(
            children: [
              const TextPadding(texto: 'Peso:'),
              Text(weightCard.toString()),
              const SizedBox(
                width: 20,
              ),
              const TextPadding(texto: 'Altura:'),
              Text(heightCard.toString()),
              const SizedBox(
                width: 20,
              ),
              const TextPadding(texto: 'IMC:'),
              Text(imcCard.toStringAsFixed(2)),
            ],
          ),
        ),
        Row(
          children: [
            const TextPadding(texto: 'Diagnóstico:'),
            Text(diagnosisResult(imcCard)),
          ],
        ),
              
      ],
    ),);
  }  
}

String diagnosisResult (double imcResult){
  String diagnosis = '';
  switch (imcResult) {
    case < 16:
      diagnosis = ('Magreza grave');
    case < 17:
      diagnosis = ('Magreza moderada');
      
    case < 18.5:
      diagnosis =('Magreza leve');
    case < 25:
      diagnosis =('Saudável');
      
    case < 30:
      diagnosis =('Sobrepeso');
      
    case < 35:
      diagnosis =('Obesidade grau 1');
      
    case < 40:
      diagnosis =('Obesidade grau 2 (severa)');
      
    case >= 40:
      diagnosis =('Obesidade grau 3 (morbida)');
      
  }
  return diagnosis;
}



