import 'package:flutter/material.dart';
import 'jour.dart';



class DetailJourView extends StatelessWidget {
  const DetailJourView({Key? key, required this.jour}) : super(key: key);

  final Jour jour;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail du jour'),
      ),
      body: Container(
        child: Text("день: ${jour.nom} \nзадача: ${jour.description}"),
      ),
    );
  }
}

