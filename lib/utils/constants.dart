import 'package:flutter/material.dart';

//constants class for defining constant values.
class Constants {
  static String url = 'https://jsonplaceholder.typicode.com/posts';

  //TextFromField widget to be used wherever needed.
  static Widget postTextField(
      String name, TextEditingController controller, TextInputType type) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      textInputAction: TextInputAction.next,
      maxLines: 1,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: name,
          fillColor: Colors.blueGrey),
    );
  }
}
