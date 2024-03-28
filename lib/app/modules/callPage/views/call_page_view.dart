import 'package:dyte_uikit/dyte_uikit.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/call_page_controller.dart';

class CallPageView extends GetView<CallPageController> {
  const CallPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CallPageController>(
      assignId: true,
      init: CallPageController(),
      builder: (logic) {
        return DyteUIKitBuilder.build(
            uiKitInfo: DyteUIKitInfo(
              controller.meetingInfo,
              designToken: DyteDesignTokens(
                colorToken: DyteColorToken(
                  brandColor: Colors.purple,
                  backgroundColor: Colors.black,
                  textOnBackground: Colors.white,
                  textOnBrand: Colors.white,
                ),
              ),
            ),
            context: context);
      },
    );
  }
}
