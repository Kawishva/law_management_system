import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:isar/isar.dart';
import 'package:page_animation_transition/animations/fade_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:window_manager/window_manager.dart';

import '../components/form.dart';
import 'home_screen.dart';

class FormScreen extends StatefulWidget {
  final user;
  final bool darkMode;
  final Isar isarDBInstance;

  FormScreen({
    super.key,
    required this.darkMode,
    required this.isarDBInstance,
    required this.user,
  });

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  Color? backgroundColor;
  final caseNo = TextEditingController();
  final police = TextEditingController();
  final location = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeWindow();
    setState(() {
      // imageFile = Uint8List.fromList(widget.user.imageBytes!);
      // darkMode = widget.user.darkmode!;
      backgroundColor = widget.darkMode == false ? Colors.white : Colors.black;
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
      await windowManager.setBackgroundColor(Colors.transparent);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor!.withOpacity(0.8),
      body: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        return Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: height / 50, left: width / 100),
                child: Container(
                  width: width / 35,
                  height: height / 25,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(PageAnimationTransition(
                            page: HoomeScreen(
                              user: widget.user,
                              isarDBInstance: widget.isarDBInstance,
                            ),
                            pageAnimationType: FadeAnimationTransition()));
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(0),
                          backgroundColor: widget.darkMode == true
                              ? Colors.blue
                              : const Color(0xFF7D7D7D),
                          foregroundColor: widget.darkMode == true
                              ? Colors.black
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      child: Icon(
                        Iconic.cancel,
                        size: width / 55,
                      )),
                ),
              ),
            ),
            Center(
                //form
                child: FormFile(
              darkMode: widget.darkMode,
              width: width,
              height: height,
              caseNo: caseNo,
              police: police,
              location: location,
            )),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:
                    EdgeInsets.only(right: width / 15, bottom: height / 30),
                child: Container(
                  width: width / 9,
                  height: height / 15,
                  decoration: BoxDecoration(
                      color: widget.darkMode == true
                          ? Colors.grey.withOpacity(0.5)
                          : Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: width / 25,
                        height: height / 25,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(0),
                                backgroundColor: widget.darkMode == true
                                    ? Colors.blue
                                    : const Color(0xFF7D7D7D),
                                foregroundColor: widget.darkMode == true
                                    ? Colors.black
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            child: Icon(
                              FontAwesome5.save,
                              size: width / 70,
                            )),
                      ),
                      SizedBox(
                        width: width / 100,
                      ),
                      Container(
                        width: width / 25,
                        height: height / 25,
                        child: ElevatedButton(
                            onPressed: () {
                              caseNo.clear();
                              police.clear();
                              location.clear();
                            },
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(0),
                                backgroundColor: widget.darkMode == true
                                    ? Colors.blue
                                    : const Color(0xFF7D7D7D),
                                foregroundColor: widget.darkMode == true
                                    ? Colors.black
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            child: Icon(
                              Icons.clear_all_rounded,
                              size: width / 50,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      })),
    );
  }
}
