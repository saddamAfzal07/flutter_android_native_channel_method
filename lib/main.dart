import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  //channel name, used in android code to invoke method
  static const channel =
      MethodChannel('package com.example.flutter_android_native');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Call Native Code to in Flutter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _showToast();
              },
              child: const Text("Show Toast"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                openCamera();
              },
              child: const Text(
                "Open Camera",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showToast() async {
    await channel.invokeMethod('showToast', <dynamic, dynamic>{
      'message': 'This is a Toast from  Android Native into Flutter'
    });
  }

  Future<void> openCamera() async {
    print(" open camera");

    await channel.invokeMethod("openCamera");
  }
}
