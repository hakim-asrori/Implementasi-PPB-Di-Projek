import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtq_mobile/views/auth/auth_screen.dart';
import 'package:rtq_mobile/views/home_screen.dart';
import 'package:sp_util/sp_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'RTQ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: (SpUtil.getBool('status') != true) ? AuthScreen() : HomeScreen(telepon: SpUtil.getString('telepon')!, token: SpUtil.getString('token')!,),
    );
  }
}