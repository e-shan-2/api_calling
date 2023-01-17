import 'package:flutter/material.dart';
import 'package:apicalling/screens/posts_page.dart';
import 'package:apicalling/screens/put_page.dart';
import 'package:apicalling/service/services.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

List body = [];

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP Get Data'),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PostsPage(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: FutureBuilder(
          future: Service.getFunc(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: body.length,
                itemBuilder: ((context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.amber,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PutPage(
                              id: body[index].id,
                              body: body[index].body,
                              title: body[index].title,
                            ),
                          ),
                        );
                      },
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            content: const Text("Do you want to delete ?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Service.delFunc(body[index].id, context);
                                  Navigator.of(ctx).pop();
                                },
                                child: const Text("Yes"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: const Text("No"),
                              ),
                            ],
                          ),
                        );
                        // Service.delFunc(body[index].id, context);
                      },
                      title: Text('${body[index].title}',
                          maxLines: 1, overflow: TextOverflow.ellipsis),
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueGrey[100],
                        // child: Text(
                        //    'ID : ${body[index].id}',
                        //   style: const TextStyle(color: Colors.black),
                        // ),
                        foregroundImage:
                            NetworkImage('https://picsum.photos/$index'),
                      ),
                      subtitle: Text('${body[index].body}',
                          overflow: TextOverflow.ellipsis),
                      // trailing: Text('User ID : ${body[index].userId}'),
                    ),
                  );
                }),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
