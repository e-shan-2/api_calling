import 'package:apicalling/screens/put_page.dart';
import 'package:flutter/material.dart';
import 'package:apicalling/screens/home.dart';

void main() {
  runApp(
    // ignore: prefer_const_constructors
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      //root of the application.
      //  initialRoute: '/',
      //  routes: {
      //  '/Put' :(context) => PutPage(id: id, title: title, body: body)
      //  },

      home: MyHome(),
    ),
  );
}
