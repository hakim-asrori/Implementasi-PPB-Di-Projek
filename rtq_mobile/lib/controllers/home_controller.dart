import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:rtq_mobile/api/remote.dart';
import 'package:rtq_mobile/models/user.dart';
import 'package:rtq_mobile/models/user_after_login.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:sp_util/sp_util.dart';

class HomeController extends GetxController {
  final remote = Remote();

  dynamic telepon;
  dynamic token;

  @override
  void onInit() {
    super.onInit();
    getDataUser();
  }

  Future getDataUser() async {
    Response response = await remote.getAll("profil/user/detail", SpUtil.getString('token')!);

    if (response.statusCode == 200) {

      return UserAfterLogin.fromJson(response.body);
      // return jsonResponse;
    }
  }
}