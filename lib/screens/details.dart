import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'main_screen.dart';

class ScreenProfile extends StatefulWidget {
  User? user;

  ScreenProfile({Key? key, required this.user}) : super(key: key);

  @override
  _ScreenProfileState createState() => _ScreenProfileState();
}

class ToDo {
  final bool completed;
  final int id;
  final String title;
  final int userId;

  ToDo(
      {required this.completed,
      required this.id,
      required this.title,
      required this.userId});

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      completed: json['completed'],
      id: json['id'],
      title: json['title'],
      userId: json['userId'],
    );
  }
}

class _ScreenProfileState extends State<ScreenProfile> {
  late List<ToDo> todo;

  Future<List<ToDo>> fetchData(int id) async {
    final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/todos?userId=$id"));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => ToDo.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  ListView users(List<ToDo> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
              color: Colors.deepPurple[200],
              elevation: 10,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                  title: Text(
                    data[index].title,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      textStyle: Theme.of(context).textTheme.headline5,
                      fontSize: 16,
                    ),
                  ),
                  leading: Icon(Icons.task),
                  trailing: Checkbox(
                    onChanged: (bool? value) {},
                    value: data[index].completed,
                  )));
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
            centerTitle: true,
            title: Text('Данные сотрудника',
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    textStyle: Theme.of(context).textTheme.headline5))),
        body: Column(children: [
          Container(
            width: double.infinity,
            child: Card(
              elevation: 10,
              color: Colors.deepPurple[300],
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(widget.user?.name ?? "",
                                style: GoogleFonts.roboto(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.yellowAccent,
                                    textStyle:
                                        Theme.of(context).textTheme.bodyText1)),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("Компания: ${widget.user?.company.name}"),
                          Text("Улица: ${widget.user?.address.street}"),
                          Text("Дом: ${widget.user?.address.suite}"),
                          Text("Город: ${widget.user?.address.city}"),
                          Text("Индекс: ${widget.user?.address.zipcode}"),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    const Text('Выполненные задачи:')
                  ],
                ),
              ),
            ),
          ),
          FutureBuilder<List<ToDo>>(
              future: fetchData(widget.user?.id ?? 0),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  todo = snapshot.data!;
                  return Expanded(child: users(todo));
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              })
        ]),
      ),
    );
  }
}
