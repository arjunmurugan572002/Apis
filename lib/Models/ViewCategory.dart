import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:untitled8/Category.dart';
import 'package:untitled8/Models/getClass.dart';
import 'package:untitled8/Models/post.dart';

class getapi extends StatefulWidget {
  const getapi({super.key});

  @override
  State<getapi> createState() => _getapiState();
}

class _getapiState extends State<getapi> {
  Future<List<CategoryList>> Getprojects()async{
    var resp = await http.get(Uri.parse("http://catodotest.elevadosoftwares.com/Category/GetAllCategories"));
    List detail=jsonDecode(resp.body)['categoryList'];
    return detail.map((e) => CategoryList.fromJson(e)).toList();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get method"),
        actions: [
          GestureDetector(onTap: ()
          {


            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Category())
            );

          },child: Icon(Icons.add_circle,size: 30,))
        ],
      ),
      body:  Center(
        child: FutureBuilder<List<CategoryList>>(
          future: Getprojects(),
          builder: (context, snapshot,) {
            if (snapshot.hasData) {
              return  DataTable(columns: [
                    DataColumn(label: Text('Col1'),),
                    DataColumn(label: Text('Col2'),),
                    DataColumn(label: Text('Col1'),),
                    DataColumn(label: Text('Col2'),),
                  //   DataColumn(label: Text("id"),
                  //       DataColumn(label: Text("category"),
                  //           DataColumn(label: Text("description"),
                  //
                  //
                  // ],
                  //
                  //
                  //
                  //     rows:[ snapshot.data!.map((e) =>   DataRow(cells: [
                  //   DataCell(Text(e.categoryId.toString())),
                  //   DataCell(Text(e.category.toString())),
                  //   DataCell(Text(e.description.toString())),
                  // ])
                  // ]).toList();
                    ], rows: [
                    DataRow(cells: [
                      DataCell(Text("1")),
                      DataCell(Text("Alex")),
                      DataCell(Text("Anderson")),
                      DataCell(Text("18")),
                    ]),
                  ],
    );


                // child: Column(
                //   children: [
                //     Text(snapshot.data!.title.toString()),
                //    Image.network(snapshot.data!.image.toString())
                //   ],
                // ),

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
