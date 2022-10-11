import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:training_app/screens/contact.add.dart';

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
          Text('Page2'),
          Text('Page3'),
        ]),
      ),
    );
  }
}
