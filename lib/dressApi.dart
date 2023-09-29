import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'Models/dressclass.dart';
import 'detailscreen.dart';



class dressapi extends StatefulWidget {
  const dressapi({super.key});

  @override
  State<dressapi> createState() => _dressapiState();
}

class _dressapiState extends State<dressapi> {

  Future<List<dress>> Getdress()async{
    var resp=await http.get(Uri.parse("https://fakestoreapi.com/products"));
    var data=jsonDecode(resp.body);

    return (data as List).map((e) => dress.fromJson(e)).toList();
  }

  @override
  void initState() {
    super.initState();
    Getdress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<List<dress>>(
          future: Getdress(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context,index){
                  return ListTile(
onTap: (){

  showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
    return SizedBox(
      height: 500,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(height: 15,),
              Text(snapshot.data![index].title.toString()),
              Image.network(snapshot.data![index].image.toString()),
              Text(snapshot.data![index].price.toString()),
            ],
          ),
        ),
      ),
    );
  }
  );

},
                    title: Text(snapshot.data![index].title.toString()),
                    leading: Image.network(snapshot.data![index].image.toString()),
                    subtitle: Text(snapshot.data![index].price.toString()),
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
    );
  }
}








