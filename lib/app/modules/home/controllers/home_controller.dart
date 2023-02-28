import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:payroll_mob/app/modules/dashboard/views/dashboard_view.dart';

import '../../login/views/login_view.dart';

class HomeController extends GetxController {
  // ignore: todo
  //TODO: Implement HomeController
  late Timer _pindah;
  final authToken = GetStorage();

  @override
  void onInit() {
    _pindah = Timer.periodic(
      Duration(seconds: 4),
      (timer) => authToken.read('token') == null
          ? Get.off(
              () => LoginView(),
              transition: Transition.leftToRight,
            )
          : Get.off(() => DashboardView()),
    );
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _pindah.cancel();

    super.onClose();
  }
}
