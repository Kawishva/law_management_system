import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:isar/isar.dart';
import 'package:law_management_system/isar_DB/entities/formSchema.dart';
import 'package:law_management_system/isar_DB/entities/userSchema.dart';
import 'package:law_management_system/screens/formShow_screen.dart';
import 'package:page_animation_transition/animations/left_to_right_faded_transition.dart';
import 'package:page_animation_transition/animations/right_to_left_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:window_manager/window_manager.dart';
import 'package:animated_icon_button/animated_icon_button.dart';
import '../components/form_components/name&textfield.dart';
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
  List<String> formNameList = [];
  final contollor = TextEditingController();

  @override
  void initState() {
    super.initState();

    dataReadFunctiond(widget.isarDBInstance);
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
    setState(() {
      formNameList.clear();
      imageFile = null;
    });
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
                            color: darkMode == true
                                ? Colors.white
                                : Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15)),
                        child: GridView.builder(
                            primary: false,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  10, // Adjust the number of columns as needed
                              crossAxisSpacing: 1,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: formNameList.length,
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0, bottom: 8),
                                      child: Container(
                                        padding: EdgeInsets.all(1),
                                        width: width / 18,
                                        height: height / 10,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  PageAnimationTransition(
                                                      page: FormShowScreen(
                                                        isarDBInstance: widget
                                                            .isarDBInstance,
                                                        user: widget.user,
                                                        police:
                                                            formNameList[index],
                                                      ),
                                                      pageAnimationType:
                                                          RightToLeftFadedTransition()));
                                            },
                                            style: ElevatedButton.styleFrom(
                                                alignment: Alignment.center,
                                                side: null,
                                                padding: EdgeInsets.only(
                                                    bottom: height / 60,
                                                    right: width / 900),
                                                elevation: 0,
                                                backgroundColor:
                                                    darkMode == true
                                                        ? Colors.transparent
                                                        : Colors.grey
                                                            .withOpacity(0.2),
                                                shadowColor: Colors.transparent,
                                                foregroundColor:
                                                    darkMode == true
                                                        ? Colors.black
                                                        : Colors.grey,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            child: Image.asset(
                                                'lib/image_assets/folder.png')),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 1, right: 1),
                                      child: Text(
                                        formNameList[index],
                                        style: TextStyle(
                                            fontSize: width / 100,
                                            color: Colors.black,
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: width / 4,
                      height: height,
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      decoration: BoxDecoration(
                          color: Color(0xFFCBCBCB).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15)),
                      child: Stack(
                        children: [
                          Opacity(
                            opacity: 0.5,
                            child: Center(
                                //form
                                child: Container(
                              width: width / 2,
                              height: height,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              child: ListView(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Form',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  NameAndTextField(
                                      controller: contollor,
                                      enable: false,
                                      darkMode: darkMode!,
                                      height: height / 30,
                                      width: width / 20,
                                      fontsize: height / 65,
                                      name: 'CaseNo :',
                                      text: '',
                                      padding: EdgeInsets.only(left: 5)),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  NameAndTextField(
                                      controller: contollor,
                                      enable: false,
                                      darkMode: darkMode!,
                                      height: height / 30,
                                      width: width / 10,
                                      fontsize: height / 65,
                                      name: 'Police :',
                                      text: '',
                                      padding: EdgeInsets.only(left: 5)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  NameAndTextField(
                                      controller: contollor,
                                      enable: false,
                                      darkMode: darkMode!,
                                      height: height / 30,
                                      width: width / 10,
                                      fontsize: height / 65,
                                      name: 'Location :',
                                      text: '',
                                      padding: EdgeInsets.only(left: 5)),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            )),
                          ),
                          Center(
                            child: Container(
                              width: width / 10,
                              height: height / 5,
                              padding: EdgeInsets.only(),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white.withOpacity(0.5),
                                  border: Border.all(
                                      width: 1.5,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                      color: darkMode == true
                                          ? Colors.black.withOpacity(0.6)
                                          : Color(0xFF7D7D7D))),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FormScreen(
                                                user: widget.user,
                                                isarDBInstance:
                                                    widget.isarDBInstance,
                                                darkMode: darkMode!,
                                              )),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.note_add_rounded,
                                    size: width / 20,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 35, left: 52),
                  child: Container(
                    padding: EdgeInsets.only(),
                    alignment: Alignment.centerRight,
                    width: 65,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Center(
                      child: Text(
                        '/Home',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )),
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
                            backgroundImage:
                                imageFile == null || imageFile!.isEmpty
                                    ? AssetImage('lib/image_assets/userDp.png')
                                    : Image.memory(imageFile!).image,
                          ))),
                )),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(top: 20, right: width / 15),
                child: SizedBox(
                  width: width / 4,
                  height: height / 23,
                  child: Center(
                    child: TextField(
                      controller: searchText,
                      onChanged: (value) {
                        searchFunction();
                      },
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
                        backgroundImage: imageFile == null || imageFile!.isEmpty
                            ? AssetImage('lib/image_assets/userDp.png')
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

  Future<void> dataReadFunctiond(Isar isar) async {
    final formsResult =
        await isar.formsClass.filter().userIDEqualTo(widget.user.id).findAll();

    if (await formsResult.isNotEmpty) {
      List<String> forSortNames = [];

      setState(() {
        for (int i = 0; i < formsResult.length; i++) {
          forSortNames.add(formsResult[i].police.toString());
        }
        forSortNames.sort();

        for (int j = 0; j < forSortNames.length - 1; j++) {
          if (forSortNames[j] != forSortNames[j + 1]) {
            formNameList.add(forSortNames[j]);
          }
        }
        // Add the last element since it won't be covered by the loop
        formNameList.add(forSortNames[forSortNames.length - 1]);

        forSortNames.clear();
        formsResult.clear();
      });
    }
  }

  void searchFunction() {
    print(searchText.text);
  }
}
