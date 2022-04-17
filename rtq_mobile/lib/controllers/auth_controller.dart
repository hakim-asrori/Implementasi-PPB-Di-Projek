import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:rtq_mobile/api/remote.dart';
import 'package:rtq_mobile/models/user.dart';
import 'package:rtq_mobile/views/home_screen.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:sp_util/sp_util.dart';

class AuthController extends GetxController {
  final remote = Remote();

  final teleponController = TextEditingController();
  final passwordController = TextEditingController();
  dynamic context = BuildContext;

  // @override
  // void onInit() {
  //   super.onInit();
  //   loginProses();
  // }

  void loginProses() async {
    ProgressDialog progressDialog = ProgressDialog(context: context);
    progressDialog.show(max: 100, msg: "Harap tunggu...");

    Response response = await remote.auth("login", {
      'no_hp': teleponController.text,
      'password': passwordController.text
    });

    progressDialog.close();

    if (response.statusCode == 200) {
      final userModel = userFromJson(response.body);
      var idRole = userModel.idRole!;
      var token = userModel.token;
      var telepon = userModel.noHp;
      var keterangan = userModel.keterangan;
      

      SpUtil.putString('token', token!);
      SpUtil.putString('telepon', telepon!);
      SpUtil.putString('keterangan', keterangan!);
      SpUtil.putBool('status', true);
      
      if (int.parse(idRole) == 3) {
        Get.off(HomeScreen(telepon: telepon, token: token));
      } else if (int.parse(idRole) == 4) {
        Get.off(HomeScreen(telepon: telepon, token: token));
      }

    } else {
      Alert(context: context, title: "Login gagal!!!", type: AlertType.error).show();
    }
  }
}