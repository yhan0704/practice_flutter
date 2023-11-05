import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice/second.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final postList = [
    {"number": "0", "color": Colors.amber},
    {"number": "1", "color": Colors.pink},
    {"number": "2", "color": Colors.yellowAccent},
    {"number": "3", "color": Colors.cyan},
    {"number": "4", "color": Colors.black},
    {"number": "5", "color": Colors.brown},
    {"number": "6", "color": Colors.lightBlue},
  ];

  static Future loadJson() async {
    final String response = await rootBundle.loadString("lib/users.json");
    final data = await json.decode(response);
    return data["students"];
  }

  Future userList = loadJson();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Title"),
      ),
      body: Container(
        child: FutureBuilder(
          future: userList,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext con, int index) {
                  return Container(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                        "${snapshot.data[index]["id"]} : ${snapshot.data[index]["full_name"]}"),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Error"),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
