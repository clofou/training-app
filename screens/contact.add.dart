import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddContact extends StatelessWidget {
  const AddContact({super.key});

  @override
  Widget build(BuildContext context) {
    final _name = TextEditingController();
    final _age = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _name,
                decoration: const InputDecoration(
                  label: Text('Enter your age'),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: _age,
                decoration: const InputDecoration(
                  label: Text('Enter Your name'),
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    _name.text = '';
                    _age.text = '';
                  },
                  child: const Text('Enregister'))
            ],
          )),
    );
  }
}
