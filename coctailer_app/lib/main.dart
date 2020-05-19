import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(CoctailerApp());
}

class CoctailerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coctails List',
      theme: ThemeData(
          primarySwatch: Colors.green, accentColor: Colors.blueAccent),
      home: CoctailList(title: 'Coctails List'),
    );
  }
}

class CoctailList extends StatefulWidget {
  final String title;

  CoctailList({this.title});

  @override
  State<StatefulWidget> createState() => _CoctailListState();
}

class _CoctailListState extends State<CoctailList> {
  var coctails = [];

  Future loadCoctailsList() async {
    var content = await rootBundle.loadString('data/coctail.json');
    var collection = json.decode(content);
    setState(() {
      coctails = collection;
    });
  }

  void initState() {
    loadCoctailsList();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: coctails.length,
        itemBuilder: (BuildContext context, int index) {
          var coctail = coctails[index];
          return ListTile(
            leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                    coctail['name'].toString().substring(0, 2).toUpperCase())),
            title: Text(coctail['name']),
            trailing: Text('>'),
            isThreeLine: true,
            subtitle: Text(
              coctail['preparation'],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
      ),
    );
  }
}
