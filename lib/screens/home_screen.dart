import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:isar/isar.dart';
import 'package:law_management_system/isar_DB/entities/userSchema.dart';
import 'package:page_animation_transition/animations/fade_animation_transition.dart';
import 'package:page_animation_transition/animations/left_to_right_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:window_manager/window_manager.dart';
import 'package:animated_icon_button/animated_icon_button.dart';
import 'form_screen.dart';
import 'login_screen.dart';

// ignore: must_be_immutable
class HoomeScreen extends StatefulWidget {
  final user;
  final Isar isarDBInstance;

  HoomeScreen({
    super.key,
    required this.user,
    required this.isarDBInstance,
  });

  @override
  State<HoomeScreen> createState() => _HoomeScreenState();
}

class _HoomeScreenState extends State<HoomeScreen> {
  Uint8List? imageFile;
  bool? darkMode;
  Color? backgroundColor;
  final searchText = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeWindow();
    setState(() {
      imageFile = Uint8List.fromList(widget.user.imageBytes!);
      darkMode = widget.user.darkmode!;
      backgroundColor = darkMode == false ? Colors.white : Colors.black;
    });
  }

  void _initializeWindow() async {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = WindowOptions(
      minimumSize: Size(800, 600),
    );

    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
      await windowManager.setMaximizable(true);
      await windowManager.setResizable(true);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        return Stack(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: height / 8.5,
                    bottom: height / 100,
                    left: width / 150,
                    right: width / 150),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: width / 4,
                      height: height,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 200),
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(15)),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(PageAnimationTransition(
                              page: FormScreen(
                                user: widget.user,
                                isarDBInstance: widget.isarDBInstance,
                                darkMode: darkMode!,
                              ),
                              pageAnimationType: FadeAnimationTransition()));
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 10,
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                    width: 3, color: Colors.white)),
                            backgroundColor: const Color(0xFFBC1307),
                            textStyle: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold)),
                        child: Text('Form'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Container(
                      padding: EdgeInsets.only(left: 15),
                      alignment: Alignment.centerRight,
                      width: width / 25 > 60 ? width / 24 : 60,
                      height: height / 18 > 40 ? height / 18 : 40,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50))),
                      child: FloatingActionButton(
                          isExtended: true,
                          foregroundColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          elevation: 5,
                          onPressed: () {
                            Scaffold.of(context).openDrawer();

                            Future.delayed(Duration(seconds: 15), () {
                              Scaffold.of(context).closeDrawer();
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: imageFile == Uint8List(0)
                                ? AssetImage(
                                    'lib/image_assets/login_background_image1.jpg')
                                : Image.memory(imageFile!).image,
                          ))),
                )),
            Padding(
              padding: EdgeInsets.only(top: 20, right: width / 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: width / 4,
                    height: height / 23,
                    child: Center(
                      child: TextField(
                        controller: searchText,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: darkMode == true
                                    ? Colors.blue.withOpacity(0.5)
                                    : Color(0xFF7D7D7D).withOpacity(0.5),
                                width: 1.5),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: darkMode == true
                                    ? Colors.blue
                                    : Color(0xFF7D7D7D),
                                width: 2,
                                strokeAlign: BorderSide.strokeAlignOutside),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25)),
                          ),
                          border: InputBorder.none,
                          counterText: '',
                          prefixIcon: Icon(
                            Icons.search,
                            size: width / 80,
                            color: darkMode == true
                                ? Colors.blue
                                : Color(0xFF7D7D7D),
                          ),
                        ),
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: height / 65,
                          color: darkMode == true ? Colors.blue : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: width / 13,
                    height: height / 25,
                    child: ElevatedButton(
                        onPressed: () {
                          print(searchText.text);
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: darkMode == true
                                ? Colors.blue
                                : const Color(0xFF7D7D7D),
                            foregroundColor:
                                darkMode == true ? Colors.black : Colors.white,
                            textStyle: TextStyle(
                                fontSize: width / 90,
                                fontWeight: FontWeight.bold)),
                        child: Text('Search')),
                  ),
                ],
              ),
            ),
          ],
        );
      })),
      drawer: LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        return Drawer(
          width: width / 7,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.only(top: 10, bottom: height / 1.3, left: 10),
            child: Container(
              padding: EdgeInsets.only(top: height / 110),
              width: width / 7,
              decoration: BoxDecoration(
                color: darkMode == true
                    ? Colors.white
                    : Color.fromARGB(255, 50, 50, 50),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 1,
                    offset: Offset(6, 6),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Stack(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: width / 80,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: width / 40,
                        backgroundImage: imageFile == Uint8List(0)
                            ? AssetImage(
                                'lib/image_assets/login_background_image1.jpg')
                            : Image.memory(imageFile!).image,
                      ),
                      SizedBox(
                        width: width / 80,
                      ),
                      Text(
                        widget.user.name,
                        style: TextStyle(
                            color:
                                darkMode == true ? Colors.black : Colors.blue,
                            fontSize: width / 80,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        AnimatedIconButton(
                          size: width / 50,
                          animationDirection: AnimationDirection.bounce(),
                          duration: const Duration(milliseconds: 500),
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          icons: <AnimatedIconItem>[
                            AnimatedIconItem(
                              backgroundColor: Colors.transparent,
                              onPressed: () async {
                                setState(() {
                                  darkMode = darkMode == false ? true : false;
                                  backgroundColor = darkMode == true
                                      ? Colors.black
                                      : Colors.white;
                                });
                                await widget.isarDBInstance.writeTxn(() async {
                                  widget.user.darkmode = darkMode = darkMode;
                                  await widget.isarDBInstance.usersClass
                                      .put(widget.user);
                                });
                              },
                              icon: Icon(
                                darkMode == false ? Iconic.sun : Iconic.moon,
                                color: darkMode == false
                                    ? Colors.orange
                                    : Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: width / 80,
                        ),
                        Container(
                          width: width / 15,
                          height: height / 25,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              SizedBox(
                                width: width / 300,
                              ),
                              Container(
                                width: width / 35,
                                height: height / 35,
                                child: FloatingActionButton(
                                  backgroundColor: backgroundColor,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: width / 800, top: height / 1000),
                                    child: Icon(
                                      FontAwesome.edit,
                                      size: width / 80,
                                      color: darkMode == false
                                          ? Colors.black
                                          : Colors.blue,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                width: width / 300,
                              ),
                              Container(
                                width: width / 35,
                                height: height / 35,
                                //logout button
                                child: FloatingActionButton(
                                  backgroundColor: backgroundColor,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: width / 350, top: height / 800),
                                    child: Icon(
                                      FontAwesome.logout,
                                      size: width / 80,
                                      color: darkMode == false
                                          ? Colors.black
                                          : Colors.blue,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        PageAnimationTransition(
                                            page: LoginScreen(
                                              isarDBInstance:
                                                  widget.isarDBInstance,
                                            ),
                                            pageAnimationType:
                                                LeftToRightFadedTransition()));
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
