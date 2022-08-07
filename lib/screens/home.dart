import 'package:flutter/material.dart';
import 'package:fluttercrudapi/models/model.dart';
import 'package:fluttercrudapi/services/service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ElevatedButton(
            onPressed: () {
              postData(Data(
                  name: "Class Api Flutter",
                  email: "Class Api Flutter",
                  username: "Class Api Flutter"));
            },
            child: const Text("Add Data")),
      ),
      body: FutureBuilder(
          future: getUser(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data.data[index].name),
                      subtitle: Text("${snapshot.data.data[index].id}"),
                      trailing: Wrap(children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                updateData(
                                    model: Data(
                                        name: "Updated Class Api Flutter",
                                        email: "Updated Class Api Flutter",
                                        username: "Updated Class Api Flutter"),
                                    id: snapshot.data.data[index].id);
                              });
                            },
                            icon: const Text("Update")),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                deleteData(id: snapshot.data.data[index].id);
                              });
                            },
                            icon: const Text("Delete")),
                      ]),
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
