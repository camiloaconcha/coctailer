import 'dart:convert';

import 'package:coctailerapp/Cocktail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(CocktailerApp());
}

class CocktailerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cocktails List',
      theme: ThemeData(
          primarySwatch: Colors.green, accentColor: Colors.blueAccent),
      home: CocktailList(title: 'Cocktails List'),
    );
  }
}

class CocktailList extends StatefulWidget {
  final String title;

  CocktailList({this.title});

  @override
  State<StatefulWidget> createState() => _CocktailListState();
}

class _CocktailListState extends State<CocktailList> {
  var cocktails = [];

  Future loadCocktailsList() async {
    http.Response response = await http.get('http://www.mocky.io/v2/5ec33efb300000940039bf35');
    print('Response status: ${response.statusCode}');
    String content = response.body;
    List collection = json.decode(content);
    List<Cocktail> _cocktails = collection.map((json)=> Cocktail.fromJson(json)).toList();
    setState(() {
      cocktails = _cocktails;
    });
  }

  void initState() {
    loadCocktailsList();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: cocktails.length,
        itemBuilder: (BuildContext context, int index) {
          Cocktail cocktail = cocktails[index];
          return ListTile(
            leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(cocktail.name.substring(0, 2).toUpperCase())),
            title: Text(cocktail.name),
            trailing: Text('>'),
            isThreeLine: true,
            subtitle: Text(
              cocktail.preparation,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
      ),
    );
  }
}
