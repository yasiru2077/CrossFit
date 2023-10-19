import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_1/dhanish/Login, signup and admin screen/utils/constants.dart';
import 'package:flutter_application_1/dhanish/Login, signup and admin screen/services/auth_services.dart';

class adminpage extends StatefulWidget {
  const adminpage({super.key});

  @override
  _adminpagestate createState() => _adminpagestate();
}

class _adminpagestate extends State<adminpage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  List<Userdets> users = <Userdets>[];

  void signOutUser(BuildContext context) {
    AuthService().signOut(context);
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 57, 47, 24),
        title: const Text(
          'User Management Admin',
          style: TextStyle(color: Color.fromARGB(255, 216, 153, 36)),
        ),
        leading: Row(
          children: [
            // Log out button
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () => signOutUser(context)),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Container(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 8.0,
              child: ListTile(
                title: Text(users[index].name,
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        height: 3)),
                subtitle: Text(
                  users[index].email,
                  style: const TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () async {
                        nameController.text = users[index].name;
                        emailController.text = users[index].email;
                        final result = await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Color.fromARGB(255, 79, 54, 14),
                              title: const Text(
                                "Edit User",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              content: Form(
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                      controller: nameController,
                                      decoration: const InputDecoration(
                                        labelText: "Name",
                                        labelStyle: TextStyle(
                                            color: Color.fromARGB(
                                                182, 255, 255, 255)),
                                      ),
                                      key: const Key('name'),
                                    ),
                                    TextFormField(
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                      controller: emailController,
                                      decoration: const InputDecoration(
                                          labelText: "Email",
                                          labelStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  182, 255, 255, 255))),
                                      key: const Key('email'),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                TextButton(
                                  child: const Text(
                                    "Save",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () async {
                                    // Getting the new name and email from the dialog
                                    final form = Form.of(context);

                                    /*if (form == null) return;*/
                                    final name = nameController.text;
                                    final email = emailController.text;
                                    // Sending a patch request to update the user in the backend
                                    final response = await http.patch(
                                      Uri.parse(
                                          '${Constants.uri}/api/userupdate'),
                                      headers: {
                                        'Content-Type': 'application/json'
                                      },
                                      body: jsonEncode({
                                        'id': users[index].id,
                                        'name': name,
                                        'email': email,
                                      }),
                                    );
                                    print(response.body);
                                    if (response.statusCode == 200) {
                                      setState(() {
                                        users[index].name = name;
                                        users[index].email = email;
                                      });
                                      Navigator.pop(context);
                                    } else {
                                      throw Exception('Failed to update user');
                                    }
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          final response = await http.delete(Uri.parse(
                              '${Constants.uri}/api/userdelete/${users[index].email}'));
                          print(response.body);
                          if (response.statusCode == 200) {
                            setState(() {
                              users.removeAt(index);
                            });
                          } else {
                            throw Exception('Failed to delete user');
                          }
                        }),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

// getting users from the database to frontend
  void getUsers() async {
    final response =
        await http.get(Uri.parse('${Constants.uri}/api/userdetails'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        users = data.map((user) => Userdets.fromJson(user)).toList();
      });
    } else {
      throw Exception('Failed to load users');
    }
  }
}

//Assigning the data took from database to the variable User
class Userdets {
  String id;
  String name;
  String email;

  Userdets({required this.id, required this.name, required this.email});

  factory Userdets.fromJson(Map<String, dynamic> json) {
    return Userdets(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
