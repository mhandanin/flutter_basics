import 'package:basics/DetailJourView.dart';
import 'package:flutter/material.dart';
import 'jour.dart';

List<Jour> jours = [
  Jour("Lundi", "Faire les courses, aller à la salle"),
  Jour("Mardi", "Réunion avec le club, réviser le code"),
  Jour("Mercredi", "Sport, travail sur le projet Flutter"),
  Jour("Jeudi", "Préparer la présentation"),
  Jour("Vendredi", "Relecture du code, détente"),
  Jour("Samedi", "Sortie avec les amis"),
  Jour("Dimanche", "Repos et planification de la semaine")
];

class Tp6Jours extends StatelessWidget {
  const Tp6Jours({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tp6Jours"),
      ),

      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(jours[index].nom, style: TextStyle(fontSize: 30)),
              onTap: (){
                // debugPrint("jour clicked: ${jours[index]}");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailJourView(jour: jours[index]),
                  ),
                );
              },
              subtitle: Text('taches à faire:  ' + jours[index].description),
              leading: CircleAvatar(
                child: Text(
                  jours[index].nom[0],
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.orange,
                  ),
                ),)
          );
        },
        separatorBuilder: (context, position) {
          return Container(
              color: Colors.orange,
              child: Icon(
                Icons.add_a_photo,
              )
          );
          },
        itemCount: jours.length,
      ),
    );
  }
}