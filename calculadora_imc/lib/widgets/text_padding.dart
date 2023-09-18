import 'package:flutter/material.dart';

class TextPadding extends StatelessWidget {
  final String texto;
  const TextPadding({ super.key, required this.texto });

   @override
   Widget build(BuildContext context) {
       return Padding(
         padding: const EdgeInsets.all(8.0),
         child: Text(texto,style: TextStyle(fontWeight: FontWeight.w500),),
       );
       
  }
}