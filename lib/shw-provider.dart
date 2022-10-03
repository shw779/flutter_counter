import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShwProvider extends StatelessWidget {
  const ShwProvider({super.key});
  static String routeName = '/provider';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("provider"),
      ),
      body: ChangeNotifierProvider(
        create: (_) => CountProvider(),
        child: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  Home({super.key});
  late CountProvider _countProvider;

  @override
  Widget build(BuildContext context) {
    _countProvider = Provider.of<CountProvider>(context, listen: false);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${Provider.of<CountProvider>(context).count}",
              style: const TextStyle(fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _countProvider.increase();
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
                    _countProvider.decrease();
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
      ),
    );
  }
}

class CountProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increase() {
    ++_count;
    notifyListeners();
  }

  void decrease() {
    --_count;
    notifyListeners();
  }
}
