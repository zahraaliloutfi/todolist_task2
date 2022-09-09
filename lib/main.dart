// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors



import 'package:flutter/material.dart';

class Model {
  @required
  String? name;
  @required
  String? time;
  Model({this.name, this.time});
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Model> user = [
    Model(time: '10:00 AM', name: 'Communication System Quiz'),
    Model(time: '11:00 AM', name: 'Os Report'),
    Model(time: '12:00 AM', name: 'Buy Some Stuff'),
    Model(time: '01:00 AM', name: 'Go to the Gym'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('To Do List '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: user.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  '${user[index].name}',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  '${user[index].time}',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('Delete'),
                              content: Text('Do you want to delete ?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {});
                                    Navigator.pop(context);
                                  },
                                  child: Text('cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      user.removeAt(index);
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text('yes'),
                                ),
                              ],
                            ));
                  },
                ),
              );
            }),
      ),
    ));
  }
}

void main(List<String> args) {
  runApp(MyApp());
}
