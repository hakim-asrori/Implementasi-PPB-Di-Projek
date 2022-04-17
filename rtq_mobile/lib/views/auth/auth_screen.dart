import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rtq_mobile/api/remote.dart';
import 'package:rtq_mobile/controllers/auth_controller.dart';

class AuthScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final teleponInput = TextFormField(
      controller: authController.teleponController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: 'Telepon',
        prefixIcon: Icon(Icons.phone),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Harap masukan no telepon!";
        }
        return null;
      },
    );
    
    final passwordInput = TextFormField(
      controller: authController.passwordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Harap masukan no password!";
        }
        return null;
      },
    );

    final loginButton = FlatButton(
      color: Color.fromARGB(255, 101, 124, 255),
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          authController.context = context;
          authController.loginProses();
        }
      },
      child: Text(
        "Login",
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(child: Container(
              margin: EdgeInsets.only(top: 400),
              width: double.infinity,
              height: 450,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 101, 124, 255),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                )
              ),
            )),
            Positioned(top: 50, child: Container(
              padding: EdgeInsets.all(40),
              child: Column(
                children: [
                  Container(
                    child: Lottie.asset('assets/splash.json'),
                    width: 150,
                    height: 150,
                  ),
                  Text(
                    "Rumah Tahfidz Quran",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 5),
              margin: EdgeInsets.only(top: 200, left: 25, right: 25),
              width: double.infinity,
              height: 320,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                    BoxShadow(
                    color: Colors.black38,
                    spreadRadius: 0.1,
                    blurRadius: 5
                  )
                ]
              ),
              child: Form(key: _formKey, child: ListView(
                padding: EdgeInsets.only(left: 24.0, right: 24.0),
                children: <Widget>[
                  SizedBox(height: 35),
                  teleponInput,
                  SizedBox(height: 35),
                  passwordInput,
                  SizedBox(height: 35),
                  loginButton,
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}