import 'package:basics/%20api_users_page.dart';
import 'package:basics/PicturesView.dart';
import 'package:basics/ProfilePage.dart';
import 'package:basics/ProfileView.dart';
import 'package:basics/SettingsView.dart';
import 'package:basics/TP6_Jours.dart';
import 'package:basics/TP6_List.dart';
import 'package:basics/UserProfile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Basics',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        // '/': (context) => const MyHomePage(title: 'home page'),
        'profile': (context) => const ProfileView(),
        '/settings': (context) => const SettingsView(),
        '/pictures': (context) => const PicturesView(),
      },
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String _genre = 'Homme';
  bool _codage = false;
  bool _design = false;
  bool _gaming = false;
  DateTime _selectedDate = DateTime.now();
  double _competenceLevel = 1.0;
  String _formation = 'Informatique';
  bool _notifications = false;
  UserProfile? _userProfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter ur name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _nomController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'UR NAME',
                ),
              ),

              SizedBox(height: 16),

              Text(
                'Enter ur age :',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _ageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter ur age',
                ),
                keyboardType: TextInputType.number,
              ),

              SizedBox(height: 24),

              Text(
                'Genre :',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              Row(
                children: [
                  Radio(
                    value: 'Homme',
                    groupValue: _genre,
                    onChanged: (String? value) {
                      setState(() {
                        _genre = value!;
                      });
                    },
                  ),
                  Text('Homme'),
                  SizedBox(width: 20),
                  Radio<String>(
                    value: 'Femme',
                    groupValue: _genre,
                    onChanged: (String? value) {
                      setState(() {
                        _genre = value!;
                      });
                    },
                  ),
                  Text('Femme'),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Centres d\'intérêt :',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              CheckboxListTile(
                title: Text('Codage'),
                value: _codage,
                onChanged: (bool? value) {
                  setState(() {
                    _codage = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),

              CheckboxListTile(
                title: Text('Design'),
                value: _design,
                onChanged: (bool? value) {
                  setState(() {
                    _design = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                title: Text('Gaming'),
                value: _gaming,
                onChanged: (bool? value) {
                  setState(() {
                    _gaming = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              SizedBox(height: 16),
              Text(
                'BirthDay :',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text('select'),
                  ),
                ],
              ),

              Text(
                'Programmation level (1-5) :',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text('beginner'),
                  Expanded(
                    child: Slider(
                      value: _competenceLevel,
                      min: 1.0,
                      max: 5.0,
                      divisions: 4,
                      label: _competenceLevel.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _competenceLevel = value;
                        });
                      },
                    ),
                  ),
                  Text('Expert'),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Formation :',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                value: _formation,
                onChanged: (String? newValue) {
                  setState(() {
                    _formation = newValue!;
                  });
                },
                items:
                    <String>[
                      'Informatique',
                      'Design',
                      'Marketing',
                      'Gestion',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'receive notification :',
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                    value: _notifications,
                    onChanged: (value) {
                      setState(() {
                        _notifications = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    String nom = _nomController.text;
                    String age = _ageController.text;

                    String message = 'Profil : $nom, $age ans, $_genre\n';
                    message += 'Formation : $_formation\n';
                    message +=
                        'Date de naissance :  ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}\n';
                    message += 'Niveau : ${_competenceLevel.round()}/5\n';
                    message += 'Intérêts : ';
                    if (_codage) message += 'Codage, ';
                    if (_design) message += 'Design, ';
                    if (_gaming) message += 'GAming';

                    List<String> interets = [];
                    if (_codage) interets.add("Codage");
                    if (_design) interets.add("Design");
                    if (_gaming) interets.add("Jeux vidéo");

                    _userProfile = UserProfile(nom: _nomController.text, age: _ageController.text, genre: _genre, interets: interets, dateDeNaissance: _selectedDate, niveauCompetence: _competenceLevel, formation: _formation, notifications: _notifications);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Profile créé avec succès!'),
                      action: SnackBarAction(label: 'voir progile', onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfilePage(userProfile: _userProfile),
                          ),
                        );
                      },
                      ),
                      )
                    );
                    
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: Text("Profile complete"),
                            content: Text(message),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Close"),
                              ),
                            ],
                          ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('HAALLLOO $nom, DU BIST $age JAAR ALT'),
                      ),
                    );
                  },
                  child: Text('valid'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pick = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pick != null && pick != _selectedDate) {
      setState(() {
        _selectedDate = pick;
      });
    }
  }

  @override
  void dispose() {
    _nomController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Navigation Menu",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  "Application flutter",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileView()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.image),
            title: Text("Pictures"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/pictures');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/settings');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("TP6 Lists"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Tp6List()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.list_alt_outlined),
            title: Text("TP6 JOURS"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Tp6Jours()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.supervised_user_circle),
            title: Text("USERS API"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ApiUsersPage()),
              );
            },
          ),
          Divider(color: Colors.red),
          ListTile(
            trailing: Icon(Icons.exit_to_app, color: Colors.red),
            title: Text("Disconnect", style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
