import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

class ShwBloc extends StatefulWidget {
  const ShwBloc({super.key});
  static String routeName = '/bloc';

  @override
  State<ShwBloc> createState() => _ShwBlocState();
}

class _ShwBlocState extends State<ShwBloc> {
  CounterBloc bloccontroller = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("bloc"),
      ),
      body: StreamBuilder(
        stream: bloccontroller.controller.stream,
        initialData: bloccontroller.counter,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          return Center(
            child: Column(
              children: [
                Text(
                  '${snapshot.data}',
                  style: const TextStyle(fontSize: 30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        bloccontroller.increase();
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20)),
                      child: const Text(
                        "+",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        bloccontroller.decrease();
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20)),
                      child: const Text(
                        "-",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    // stream도 닫아줘야 한다.
    log("test......");
    bloccontroller.dispose();
    super.dispose();
  }
}

class CounterBloc {
  int counter = 0;
  StreamController<int> controller = StreamController<int>();
  StreamSink get sink => controller.sink;

  increase() {
    log("tset : $counter");
    sink.add(++counter);
  }

  void decrease() {
    sink.add(--counter);
  }

  void dispose() {
    controller.close();
  }
}
