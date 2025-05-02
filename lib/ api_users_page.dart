import 'package:basics/%20api_users_page.dart';
import 'package:flutter/material.dart';
import 'api_service.dart';
import 'user_api_model.dart';
import 'user_detail_page.dart';


class ApiUsersPage extends StatefulWidget {
  const ApiUsersPage({Key? key}) : super(key: key);
  @override
  _ApiUsersPageState createState() => _ApiUsersPageState();
}

class _ApiUsersPageState extends State<ApiUsersPage> {
  late Future<List<UserApiModel>> _usersFuture;

  @override
  void initState() {
    super.initState();
    _usersFuture = ApiService.getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API USERS')),
      body: FutureBuilder<List<UserApiModel>>(
        future: _usersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, color: Colors.red, size: 60),
                  SizedBox(height: 16),
                  Text(
                    'Erreur: ${snapshot.error}',
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _usersFuture = ApiService.getAllUsers();
                      });
                    },
                    child: Text('Réessayer'),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucun utilisateur trouvé'));
          } else {
            final users = snapshot.data!;
            return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue.shade100,
                        child: Text(user.id.toString()),
                      ),
                      title: Text(user.name),
                      subtitle: Text(user.email),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>UserDetailPage(user: user)),
                        );
                      },
                    ),
                  );
                }
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          _usersFuture = ApiService.getAllUsers();
        });
      },
      tooltip: 'Rafraichir',
      child: Icon(Icons.refresh)
      ),
    );
  }
}
