import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/CatFactClass.dart';

class CatFactAPI extends StatefulWidget {
  const CatFactAPI({super.key});

  @override
  State<CatFactAPI> createState() => _CatFactAPIState();
}

class _CatFactAPIState extends State<CatFactAPI> {
  Future<CatFact> GetCatFacts() async
  {
    var resp = await http.get(Uri.parse("https://catfact.ninja/fact"));
    return CatFact.fromJson(jsonDecode(resp.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<CatFact>(
          future: GetCatFacts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Text(snapshot.data!.fact.toString()),
                  Text(snapshot.data!.length.toString())
                 ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );

  }
}
