import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxState extends StatelessWidget {
  GetxState({super.key});
  static String routeName = '/getx';

  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("getx"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                "${controller.num.value}",
                style: const TextStyle(fontSize: 30),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.increase();
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
                    controller.decrease();
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

class Controller extends GetxController {
  RxInt num = 0.obs;

  void increase() {
    num.value = num.value + 1;
  }

  void decrease() {
    num.value = num.value - 1;
  }
}
