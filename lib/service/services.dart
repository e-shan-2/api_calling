import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apicalling/screens/home.dart';
import 'package:apicalling/models/model.dart';
import 'package:apicalling/utils/constants.dart';

//class to use methods of http in API calling.
class Service {
  //Get method of http for API call.
  static Future getFunc() async {
    var response = await http.get(Uri.parse(Constants.url));
    if (response.statusCode == 200) {
      body =
          jsonDecode(response.body).map((e) => PostsModel.fromJson(e)).toList();
      return body;
    }
  }

  //Post method of http for API call.
  static postFunc(var id, String title, String body, context) async {
    var response = await http.post(Uri.parse(Constants.url),
        body: {'id': id, 'title': title, 'body': body});
    if (response.statusCode == 201) {
      String finalValue = response.body;
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          content: Text("Data added \nResponse code : ${response.statusCode}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('Ok'),
            )
          ],
        ),
      );
      return PostsModel.fromJson(jsonDecode(finalValue));
    } else {
      throw const Text('Unexpected Error');
    }
  }

  //Put method of http for API call.
  static putFunc(var id, var title, var body, context) async {
    var url = Uri.parse(Constants.url + "/$id");
    var response =
        await http.put(url, body: {'id': id, 'title': title, 'body': body});
    String finalValue = response.body;

    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          content: Text(
              "Put Successfully \nResponse Code is ${response.statusCode}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text("Okay"),
            ),
          ],
        ),
      );
      return PostsModel.fromJson(jsonDecode(finalValue));
    } else {
      return const Center(
        child: Text('Error'),
      );
    }
  }

  //Delete method of http for API call.
  static delFunc(int id, context) async {
    var url = Uri.parse(Constants.url + "/$id");
    var response = await http.delete(url);
    if (response.statusCode == 200) {
      //SnackBar to show success message.
      var snackbar = const SnackBar(content: Text('Deleted Successfully'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {
      return const Center(
        child: Text('Error'),
      );
    }
  }
}
