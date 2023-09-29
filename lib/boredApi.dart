import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'Models/bored class.dart';

class boredapi extends StatefulWidget {
  const boredapi({super.key});

  @override
  State<boredapi> createState() => _boredapiState();
}

class _boredapiState extends State<boredapi> {
  Future<bored> Getbored()async
  {
    var resp=await http.get(Uri.parse("https://www.boredapi.com/api/activity"));
    return bored.fromJson(jsonDecode(resp.body));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<bored>(
          future: Getbored(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Text(snapshot.data!.link.toString()),
                  Text(snapshot.data!.key.toString()),

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
