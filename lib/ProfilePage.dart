import 'package:basics/UserProfile.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  final UserProfile? userProfile;

  const ProfilePage({Key? key, this.userProfile}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile utilisateur'),
      ),
      body: userProfile == null ? _buildEmptyProfile() : _buildUserProfile(),
    );
  }


  Widget _buildEmptyProfile() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person_off, size: 100, color: Colors.grey,),
          SizedBox(height: 20),
          Text("Aucun Profil disponible", style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          Text(
              'Remplissez le formulaire sur la page d\'accueil',
              style: TextStyle(color: Colors.grey)
          ),
        ],
      ),
    );
  }

  Widget _buildUserProfile() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue.shade100,
              child: Icon(Icons.person, size: 60, color: Colors.blue),
            ),
          ),
          SizedBox(height: 24),
          ProfileInfoCard(
            title: 'Informations personnelles',
            children: [
              ProfileInfoRow(label: 'Nom', value: userProfile!.nom),
              ProfileInfoRow(label: 'Âge', value: '${userProfile!.age} ans'),
              ProfileInfoRow(label: 'Genre', value: userProfile!.genre),
              ProfileInfoRow(
                  label: 'Date de naissance',
                  value:
                  '${userProfile!.dateDeNaissance.day}/${userProfile!.dateDeNaissance.month}/${
                      userProfile!.dateDeNaissance.year}'
              ),
            ],
          ),
          SizedBox(height: 16),
          ProfileInfoCard(
            title: 'Formation et compétences',
            children: [
              ProfileInfoRow(label: 'Formation', value:
              userProfile!.formation),
              ProfileInfoRow(
                label: 'Niveau en programmation',
                value: '${userProfile!.niveauCompetence.round()}/5',
              ),
            ],
          ),
          SizedBox(height: 16),
          ProfileInfoCard(
            title: 'Centres d\'intérêt',
            children: [
              ProfileInfoRow(
                label: 'Intérêts',
                value: userProfile!.interets.join(', '),
              ),
            ],
          ),
          SizedBox(height: 16),
          ProfileInfoCard(
            title: 'Préférences',
            children: [

              ProfileInfoRow(
                label: 'Notifications',
                value: userProfile!.notifications ? 'Activées' :
                'Désactivées',
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class ProfileInfoRow extends StatelessWidget {

  final String label;
  final String value;

  const ProfileInfoRow({
    Key? key,
    required this.label,
    required this.value,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}


class ProfileInfoCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const ProfileInfoCard({
    Key? key,
    required this.title,
    required this.children,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            ...children,
          ],
        ),
      ),
    );
  }
}


// TODO: key in super


