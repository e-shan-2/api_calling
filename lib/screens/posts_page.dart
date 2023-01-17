import 'package:flutter/material.dart';
import 'package:apicalling/service/services.dart';
import 'package:apicalling/utils/constants.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

//Post page to add the data in the API.
class _PostsPageState extends State<PostsPage> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Post Data'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Constants.postTextField("id", id, TextInputType.number),
            SizedBox(height: MediaQuery.of(context).size.width * 0.028),
            Constants.postTextField("title", title, TextInputType.text),
            SizedBox(height: MediaQuery.of(context).size.width * 0.028),
            Constants.postTextField("body", body, TextInputType.text),
            SizedBox(height: MediaQuery.of(context).size.width * 0.028),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber)),
                onPressed: () {
                  Service.postFunc(id.text, title.text, body.text, context);
                },
                child: const Text('Ok')),
          ],
        ),
      ),
    );
  }
}
