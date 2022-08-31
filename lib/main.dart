import 'dart:convert';

import 'package:flutter/material.dart';

import 'apis.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: HomeBubbleItem(),
              flex: 2,
            ),
            Expanded(
              child: Container(),
              flex: 1,
            )
          ],
        )));
  }

  HomeBubbleItem() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          createRingView(Colors.white12),
          Container(
            margin: EdgeInsets.all(40),
            child: createRingView(Colors.white54),
          ),
          Container(
            margin: EdgeInsets.all(80),
            child: createRingView(Colors.white70),
          ),
          Container(
            margin: EdgeInsets.all(120),
            child: createRingView(Colors.white),
          ),
          // Container(
          //   margin: EdgeInsets.all(100),
          //   child: createRingView(Colors.white),
          // ),
          Positioned(
            top: MediaQuery.of(context).size.height / 22,
            left: MediaQuery.of(context).size.width / 3,
            child: imageView(),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 10,
            left: MediaQuery.of(context).size.width / 25,
            child: imageView(),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 6,
            right: MediaQuery.of(context).size.width / 5,
            child: imageView(),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3,
            right: MediaQuery.of(context).size.width / 4,
            child: imageView(),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 5,
            left: MediaQuery.of(context).size.width / 4,
            child: imageView(),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2,
            left: MediaQuery.of(context).size.width / 4,
            child: imageView(),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3,
            left: MediaQuery.of(context).size.width / 15,
            child: imageView(),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 16,
            right: MediaQuery.of(context).size.width / 13,
            child: imageView(),
          ),
        ],
      ),
    );
  }

  createRingView(Color color) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(2000),
        ),
        border: Border.all(
          width: 7,
          color: color,
          style: BorderStyle.solid,
        ),
      ),
    );
  }

  imageView() {
    return InkWell(
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
              height: 40,
              width: 40,
              color: Colors.white,
              padding: EdgeInsets.all(4),
              child: FlutterLogo(size: 40)),
        ),
      ),
      onTap: () {
        callAPI();
      },
    );
  }

  Future<void> callAPI() async {
    Map<String, String> map = {
      'name': "abc1",
      'email': "abc1@gmail.com",
      'password': "123456",
    };

    String response = await postWithBody(
        "https://jobportal.vebasatrading.com/api/register", map, context);

    // return UserLoginAndRegisterResponse.fromJson(jsonDecode(response));
    print('response=====>>>>> ${jsonDecode(response)}');
  }
}
