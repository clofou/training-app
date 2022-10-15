import 'package:flutter/material.dart';
import 'package:training_app/services/my.database.dart';

import '../model/user.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<User> initialList = [];
  Future get() async {
    initialList = await getData();
    print(initialList[0].name);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      get();
    });
  }

  final controller = TextEditingController();
  List<User> filteredList = [];

  @override
  Widget build(BuildContext context) {
    get();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: controller,
            onChanged: (value) {
              value = value.toLowerCase();
              setState(() {
                filteredList = initialList
                    .where(
                        (element) => element.name.toLowerCase().contains(value))
                    .toList();
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          if (controller.text.isEmpty)
            Expanded(
                child: ListView.builder(
              itemCount: initialList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(initialList[index].name),
                );
              },
            ))
          else
            Expanded(
                child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredList[index].name),
                );
              },
            ))
        ],
      ),
    );
  }
}
