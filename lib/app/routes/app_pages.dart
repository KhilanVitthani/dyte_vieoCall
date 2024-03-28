import 'package:get/get.dart';

import '../modules/callPage/bindings/call_page_binding.dart';
import '../modules/callPage/views/call_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CALL_PAGE,
      page: () => const CallPageView(),
      binding: CallPageBinding(),
    ),
  ];
}
