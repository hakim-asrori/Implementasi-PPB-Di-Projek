import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rtq_mobile/controllers/home_controller.dart';
import 'package:rtq_mobile/models/user_after_login.dart';
import 'package:rtq_mobile/views/auth/auth_screen.dart';
import 'package:sp_util/sp_util.dart';

class HomeScreen extends StatefulWidget {
  final String telepon;
  final String token;

  HomeScreen({required this.telepon, required this.token});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final heightBody = MediaQuery.of(context).size.height;
    final widhtBody = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 101, 124, 255),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: PopupMenuButton(
              onSelected: (value) => onSelected(context, value as int),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                      Text(
                        "Log Out",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Container(
        child: Container(
          height: heightBody,
          width: widhtBody,
          child: Column(
            children: [
              Container(
                height: heightBody / 3.5,
                width: widhtBody,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      height: 150,
                      width: widhtBody,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(90),
                              bottomRight: Radius.circular(90),
                            ),
                            color: Color.fromARGB(255, 101, 124, 255)),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      height: 210,
                      width: widhtBody / 1.2,
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: FutureBuilder(
                            future: homeController.getDataUser(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              // print(snapshot.data);

                              UserAfterLogin? asatidz = snapshot.data;

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.yellow,
                                    strokeWidth: 10,
                                    // value: 1,
                                    color: Color.fromARGB(255, 101, 124, 255),
                                  ),
                                );
                              } else if (snapshot.data == null) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(
                                        backgroundColor: Colors.yellow,
                                        strokeWidth: 10,
                                        // value: 1,
                                        color:
                                            Color.fromARGB(255, 101, 124, 255),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text("Data Sedang Dalam Perjalanan")
                                    ],
                                  ),
                                );
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return const CircularProgressIndicator();
                              }
                              // print(asatid.avatar);

                              return Column(
                                // color: mainColor,
                                children: [
                                  // ProfilePicture(
                                  //     sizeAvatar: 90,
                                  //     sizeIcon: 0,
                                  //     widthBtn: 0,
                                  //     avatar: asatidz!.gambar),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    asatidz!.nama.toString(),
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    SpUtil.getString('keterangan')!,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // SectionMenuAsatidz()
            ],
          ),
        ),
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        // Get.to(ProfileScreen(
        //   telepon: SpUtil.getString('no_hp'),
        //   token: widget.token,
        // ));
        break;
      case 1:
        SpUtil.clear();
        Get.off(AuthScreen());
        break;
      default:
    }
  }
}
