import '../modules/home/home_bindings.dart';
import '../modules/home/home_page.dart';
import 'package:get/get.dart';

class HomeRouters {
  HomeRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/',
      binding: HomeBindings(),
      page: () => const HomePage(),
    ),
  ];
}
