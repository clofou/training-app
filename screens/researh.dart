import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:training_app/services/my.database.dart';

import '../model/user.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<String> theName = [];

  final controller = TextEditingController();
  List<String> filteredList = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: controller,
            onChanged: (value) {
              value = value.toLowerCase();
              setState(() {
                filteredList = theName
                    .where((element) => element.toLowerCase().contains(value))
                    .toList();
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          if (controller.text.isEmpty && theName.isEmpty)
            FutureBuilder<List<User>>(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  for (var i = 0; i < snapshot.data!.length; i++) {
                    theName.add(snapshot.data![i].name);
                  }
                  return Expanded(
                      child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].name),
                      );
                    },
                  ));
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text("Aucune Donnée"),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            )
          else if (controller.text.isEmpty && theName.isNotEmpty)
            Expanded(
                child: ListView.builder(
              itemCount: theName.length,
              itemBuilder: (context, index) {
                print("Hello");
                return ListTile(
                  title: Text(theName[index]),
                );
              },
            ))
          else
            Expanded(
                child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredList[index]),
                );
              },
            ))
        ],
      ),
    );
  }
}
/*
Expanded(
                child: ListView.builder(
              itemCount: theName.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(theName[index]),
                );
              },
            ))
*/