import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled8/Models/publicClass.dart';


class publicapi extends StatefulWidget {
  const publicapi({super.key});

  @override
  State<publicapi> createState() => _publicapiState();
}

class _publicapiState extends State<publicapi> {
  Future<List<Entries>> Getpublic()async{
    var resp=await http.get(Uri.parse("https://api.publicapis.org/entries"));
    var data=jsonDecode(resp.body)["entries"];

    return (data as List).map((e) => Entries.fromJson(e)).toList();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<List<Entries>>(
          future: Getpublic(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context,index){
                  return ListTile(

                    title: Text(snapshot.data![index].aPI.toString()),
                    leading: Text(snapshot.data![index].auth.toString()),
                    subtitle: Text(snapshot.data![index].category.toString()),
                  );
                },
                // child: Column(
                //   children: [
                //     Text(snapshot.data!.title.toString()),
                //    Image.network(snapshot.data!.image.toString())
                //   ],
                // ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );;
  }
}
