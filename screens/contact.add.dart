import 'package:flutter/material.dart';
import 'package:training_app/model/user.dart';
import 'package:training_app/services/my.database.dart';

class AddContact extends StatelessWidget {
  const AddContact({super.key});

  @override
  Widget build(BuildContext context) {
    final name = TextEditingController();
    final age = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: age,
                decoration: const InputDecoration(
                  label: Text('Enter your age'),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  label: Text('Enter Your name'),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    addUser(User(name: name.text, age: int.parse(age.text)));
                    name.text = '';
                    age.text = '';
                  },
                  child: const Text('Enregister'))
            ],
          )),
    );
  }
}
