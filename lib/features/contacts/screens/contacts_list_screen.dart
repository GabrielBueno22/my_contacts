import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_contacts/features/contacts/screens/add_contacts_screen.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  TextEditingController editingController = TextEditingController();
  List<String> item = ["Contato 1", "Contato 2", "Contato 3"];
  final StreamController<List<String>> _showItems =
      StreamController<List<String>>();

  // this method sort the item.
  void sorting() {
    setState(() {
      item.sort();
    });
  }

  @override
  void initState() {
    _showItems.add(item);
    super.initState();
  }

  // This method set the new index to the element.
  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final items = item.removeAt(oldindex);
      item.insert(newindex, items);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.green[400],
          appBar: AppBar(
            title: const Text(
              'Reorderable ListView',
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const AddContactsScreen(),
                ),
              );
            },
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    final mylist = item
                        .where((element) =>
                            element.toLowerCase().contains(value.toLowerCase()))
                        .toList();
                    _showItems.add(mylist);
                  },
                  controller: editingController,
                  decoration: const InputDecoration(
                      labelText: "Search",
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
              Expanded(
                  child: StreamBuilder<List<String>>(
                stream: _showItems.stream,
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return ReorderableListView.builder(
                      onReorder: reorderData,
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, index) {
                        return Card(
                          color: Colors.white,
                          key: ValueKey(snapshot.data![index]),
                          elevation: 2,
                          child: ListTile(
                            title: Text(snapshot.data![index]),
                          ),
                        );
                      }),
                    );
                  }
                  return Container();
                },
              )),
            ],
          ),
        ));
  }
}
