import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dyte_uikit/dyte_uikit.dart';
import 'package:dyte_videocll/app/data/NetworkClient.dart';
import 'package:dyte_videocll/app/data/sizeConstant.dart';
import 'package:dyte_videocll/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  String meetingId = 'bbb3390b-aee6-40d9-ad34-22dd95f5c4d4';
  DyteMeetingInfoV2? meetingInfo;
  @override
  void onInit() {
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

  getAuthToken({required BuildContext context}) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization':
          'Basic NDY5Y2YyNDAtYzRiZi00MzNjLThhZWEtOWZiNzg0OGVlNzZmOjZhZDIwMDExNmMyMGJmZmQwNDU5',
      'Content-Type': 'application/json'
    };
    await NetworkClient.getInstance.callApi(
      context,
      "https://api.dyte.io/v2/meetings/",
      "bbb3390b-aee6-40d9-ad34-22dd95f5c4d4/participants",
      MethodType.Post,
      params: {
        "name": "Khilan",
        "preset_name": "group_call_host",
        "custom_participant_id": "1"
      },
      header: headers,
      successCallback: (response, message) {
        print(response);
        if (!isNullEmptyOrFalse(response)) {
          meetingInfo = DyteMeetingInfoV2(
            authToken: response['data']['token'],
            baseUrl: 'https://api.dyte.io/v2',
            enableAudio: true,
            enableVideo: true,
          );
          Permission.camera.request();
          Permission.microphone.request();
          Get.toNamed(Routes.CALL_PAGE, arguments: {
            'meetingInfo': meetingInfo,
            'meetingId': meetingId,
          });
        }
      },
      failureCallback: (message, statusCode) {
        print(message);
      },
    );
  }
}
