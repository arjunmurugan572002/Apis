import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled8/Models/ViewCategory.dart';

class Category extends StatefulWidget {
 
  const Category( {super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  final TextEditingController category = TextEditingController();
  final TextEditingController description = TextEditingController();

  Future<bool> insertCategory(String category, description) async {
    final response = await http.post(
      Uri.parse("http://catodotest.elevadosoftwares.com/Category/insertCategory"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'category': category,
        'description': description,
      }),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
        ),
        body: buildColumn()
    );
  }

  buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: category,
          decoration: const InputDecoration(border: OutlineInputBorder(),
              hintText: 'Enter Title'),
        ),
        const SizedBox(height: 10,),
        TextField(
          controller: description,
          decoration: const InputDecoration(border: OutlineInputBorder(),
              hintText: 'Enter id'),
        ),



      ElevatedButton(
        onPressed: () async {
          if (await insertCategory(category.text, description.text)) {
            print("Success");
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => getapi()));
          }
        },





   child: const Text('Submit'))






      ],
    );
  }
}
