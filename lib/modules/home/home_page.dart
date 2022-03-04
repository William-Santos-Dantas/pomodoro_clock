import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff1542bf),
              Color(0xff51a8ff),
            ],
            begin: FractionalOffset(0.5, 1),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text(
                'Pomodoro Clock',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
            Obx(
              () => Expanded(
                child: CircularPercentIndicator(
                  percent: controller.percent,
                  animation: true,
                  animateFromLastPercent: true,
                  radius: context.widthTransformer(reducedBy: 70),
                  lineWidth: 20,
                  progressColor: Colors.white,
                  center: Text(
                    "${controller.displayMinutes}:${controller.displaySeconds}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: const [
                                  Text(
                                    'Timer',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '25',
                                    style: TextStyle(fontSize: 80),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: const [
                                  Text(
                                    'Pause Timer',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '5',
                                    style: TextStyle(fontSize: 80),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SizedBox(
                          width: context.widthTransformer(reducedBy: 60),
                          child: Obx(
                            () => ElevatedButton(
                              onPressed: controller.init ? controller.stop : controller.playTimer,
                              style: ElevatedButton.styleFrom(
                                primary: controller.init ? Colors.red : Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(controller.init ? 'Stop' : 'Start'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
