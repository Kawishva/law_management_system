import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:isar/isar.dart';
import 'package:law_management_system/isar_DB/entities/userSchema.dart';
import 'package:window_manager/window_manager.dart';
import 'package:animated_icon_button/animated_icon_button.dart';

// ignore: must_be_immutable
class HoomeScreen extends StatefulWidget {
  final user;
  final Isar isarDBInstance;

  HoomeScreen({super.key, required this.user, required this.isarDBInstance});

  @override
  State<HoomeScreen> createState() => _HoomeScreenState();
}

class _HoomeScreenState extends State<HoomeScreen> {
  Uint8List? imageFile;
  bool? darkMode;
  Color? backgroundColor;

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

    WindowOptions windowOptions = const WindowOptions(
      size: Size(1280, 800),
      minimumSize: Size(800, 600),
    );

    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
      await windowManager.setMaximizable(true);
      await windowManager.setResizable(true);
      await windowManager.center();
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
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
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

                            /* Future.delayed(Duration(seconds: 5), () {
                              Scaffold.of(context).closeDrawer();
                            });*/
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: imageFile == Uint8List(0)
                                ? AssetImage(
                                    'lib/image_assets/login_background_image1.jpg')
                                : Image.memory(imageFile!).image,
                          ))),
                ))
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
                color: Colors.white,
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
                        radius: width / 50,
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
                            color: Colors.black,
                            fontSize: width / 95,
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
