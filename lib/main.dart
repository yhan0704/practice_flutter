import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Title"),
      ),
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: () {
              showDialog(context: context, 
              builder: (BuildContext con){
                return AlertDialog(
                  title: const Text("Dialog Text"),
                  content: Container(
                    child: const Text(
                      "Dialog Content"
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: ()=> Navigator.of(context).pop(),
                      child: const Text("close"),
                    )
                  ],
                );
              },
              );
            },
            child: const Text("button"),
          ),
        ),
      ),
    );
  }
}
