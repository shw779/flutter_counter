import 'package:flutter/material.dart';
import 'package:test/shw-bloc.dart';
import 'package:test/shw-getx.dart';
import 'package:test/route.dart';
import 'package:test/shw-provider.dart';
import 'package:test/shw-setstate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: routes,
      home: Scaffold(
        appBar: AppBar(
          title: Column(
            children: const [
              Text("상태관리"),
            ],
          ),
        ),
        body: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(StateType1.routeName);
            },
            style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
            child: const Text(
              "setstate",
              style: TextStyle(fontSize: 30),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ShwBloc.routeName);
            },
            style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
            child: const Text(
              "bloc",
              style: TextStyle(fontSize: 30),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ShwProvider.routeName);
            },
            style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
            child: const Text(
              "provider",
              style: TextStyle(fontSize: 30),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(GetxState.routeName);
            },
            style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
            child: const Text(
              "getx",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
