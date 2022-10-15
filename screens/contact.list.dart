import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:training_app/services/my.database.dart';

import '../model/user.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    List<User> allusers = [];
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("users")
          .orderBy('age')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Erreur'),
          );
        } else if (snapshot.hasData) {
          allusers = snapshot.data!.docs
              .map((e) => User.fromJson(e.data() as Map<String, dynamic>))
              .toList();
          return ListView.builder(
            itemCount: allusers.length,
            itemBuilder: (context, index) {
              return ListTile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              final theName = TextEditingController();
                              final theAge = TextEditingController();
                              theName.text = allusers[index].name;
                              theAge.text = allusers[index].age.toString();
                              return AlertDialog(
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        update(User(
                                            id: allusers[index].id,
                                            name: theName.text,
                                            age: theAge.text));
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Update')),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancel'))
                                ],
                                title:
                                    Text("Tableau de ${allusers[index].name}"),
                                content: SingleChildScrollView(
                                    child: Column(
                                  children: [
                                    TextField(
                                      style: const TextStyle(
                                          color: Colors.pink,
                                          fontWeight: FontWeight.bold),
                                      controller: theName,
                                      decoration: const InputDecoration(
                                        labelText: "Nom",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    TextField(
                                      controller: theAge,
                                      style: const TextStyle(
                                          color: Colors.pink,
                                          fontWeight: FontWeight.bold),
                                      decoration: const InputDecoration(
                                        labelText: "Age",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                  ],
                                )),
                              );
                            },
                          );
                        },
                        child: const Icon(
                          Icons.edit,
                        )),
                    TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        delete(allusers[index].id);
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Oui")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Non")),
                                ],
                                title: Text(
                                    "Voulez-vous Vraiment supprimer ${allusers[index].name}"),
                              );
                            },
                          );
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ))
                  ],
                ),
                subtitle: Text(allusers[index].age.toString()),
                leading: CircleAvatar(
                  backgroundColor: Colors.pink,
                  child:
                      Text(allusers[index].name.substring(0, 2).toUpperCase()),
                ),
                title: Text(allusers[index].name),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
