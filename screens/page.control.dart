import 'package:flutter/material.dart';
import 'package:training_app/screens/contact.add.dart';
import 'package:training_app/screens/contact.list.dart';
import 'package:training_app/screens/researh.dart';

class PageControl extends StatelessWidget {
  const PageControl({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Contact App'),
          bottom: const TabBar(tabs: [
            Tab(
              text: 'Add',
              icon: Icon(Icons.add),
            ),
            Tab(
              text: 'Contact List',
              icon: Icon(Icons.list),
            ),
            Tab(
              text: 'search',
              icon: Icon(Icons.search),
            )
          ]),
        ),
        body: const TabBarView(children: [
          AddContact(),
          ContactList(),
          TestPage(),
        ]),
      ),
    );
  }
}
