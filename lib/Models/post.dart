import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled8/getApi.dart';

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

class post extends StatefulWidget {
  const post({super.key});

  @override
  State<post> createState() {
    return _postState();
  }
}

class _postState extends State<post> {

  final TextEditingController category = TextEditingController();
  final TextEditingController description = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
        ),
        body: buildColumn()
      )
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

          },
          child: const Text('Submit'),
        ),
      ],
    );
  }

  // FutureBuilder<Album> buildFutureBuilder() {
  //   return FutureBuilder<Album>(
  //     future: _futureAlbum,
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         return Column(
  //           children: [
  //             Text(snapshot.data!.title),
  //         Text(snapshot.data!.id.toString())
  //           ],
  //         );
  //       } else if (snapshot.hasError) {
  //         return Text('${snapshot.error}');
  //       }
  //
  //       return const CircularProgressIndicator();
  //     },
  //   );
  // }
}