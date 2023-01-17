import 'package:flutter/material.dart';
import 'package:apicalling/service/services.dart';
import 'package:apicalling/utils/constants.dart';

//Put page to update the data in the API.
class PutPage extends StatefulWidget {
  const PutPage({
    Key? key,
    required this.id,
    required this.title,
    required this.body,
  }) : super(key: key);

  final int id;
  final String title, body;
  @override
  State<PutPage> createState() => _PutPageState();
}

class _PutPageState extends State<PutPage> {
  TextEditingController id = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    id.dispose();
    title.dispose();
    body.dispose();
  }

  @override
  Widget build(BuildContext context) {
    id.text = '${widget.id}';
    title.text = widget.title;
    body.text = widget.body;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Put'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Constants.postTextField('ID', id, TextInputType.number),
            SizedBox(height: MediaQuery.of(context).size.width * 0.028),
            Constants.postTextField('Title', title, TextInputType.text),
            SizedBox(height: MediaQuery.of(context).size.width * 0.028),
            Constants.postTextField('Body', body, TextInputType.text),
            SizedBox(height: MediaQuery.of(context).size.width * 0.028),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber)),
              onPressed: () async {
                await Service.putFunc(id.text, title.text, body.text, context);
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      ),
    );
  }
}
