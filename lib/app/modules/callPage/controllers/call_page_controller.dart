import 'package:dyte_uikit/dyte_uikit.dart';
import 'package:get/get.dart';

class CallPageController extends GetxController {
  var meetingInfo;
  @override
  void onInit() {
    if (Get.arguments != null) {
      meetingInfo = Get.arguments['meetingInfo'];
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
