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

@override
void initState() {
  super.initState();

  _getUsername();
}

_saveUsername() {
  setState(() {
    _username = userIdController.text;

    _prefs.setString("currentUsername", userIdController.text);
  });
}

_getUsername() async {
  _prefs = await SharedPreferences.getInstance();

  setState(() => _username = _prefs.getString("currentUsername") ?? "Not set");
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Title"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: Text("Current Username: $_username"),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: TextField(
                  controller: userIdController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Input your username",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _saveUsername(),
                child: Container(
                  color: Colors.green,
                  padding: EdgeInsets.all(15),
                  child: Text("Save"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
