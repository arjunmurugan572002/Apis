import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:untitled8/Models/dressclass.dart';

import 'Models/dressclass.dart';
import 'Models/dressclass.dart';
import 'Models/dressclass.dart';


class detailscreen extends StatelessWidget {
  const detailscreen({super.key, required this.Dress});
    final dress Dress;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Text(Dress.title!.toString()),
           Image.network(Dress.image!.toString()),
          Text(Dress.description!.toString()),
          Text(Dress.price!.toString()),
          Text(Dress.category!.toString()),
          Text(Dress.rating!.toString()),
        ],
      ),
    );
  }
}
