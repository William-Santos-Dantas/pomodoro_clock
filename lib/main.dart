import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/bindings/application_binding.dart';
import 'core/ui/dar_week_ui.dart';
import 'routes/home_routers.dart';

Future<void> main() async {
  runApp(const DartWeekMainApp());
}

class DartWeekMainApp extends StatelessWidget {
  const DartWeekMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pomodoro Clock',
      theme: DartWeekUi.theme,
      initialBinding: ApplicationBinding(),
      getPages: [
        ...HomeRouters.routers,
      ],
    );
  }
}
