import 'dart:typed_data';
import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:isar/isar.dart';
import 'package:law_management_system/isar_DB/entities/formSchema.dart';
import 'package:law_management_system/isar_DB/entities/userSchema.dart';
import 'package:law_management_system/screens/home_screen.dart';
import 'package:page_animation_transition/animations/left_to_right_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import '../components/form_components/name&textfield.dart';
import 'login_screen.dart';

class FormShowScreen extends StatefulWidget {
  final user;
  final Isar isarDBInstance;
  final String police;

  FormShowScreen(
      {super.key,
      required this.isarDBInstance,
      required this.user,
      required this.police});

  @override
  State<FormShowScreen> createState() => _FormShowScreenState();
}

class _FormShowScreenState extends State<FormShowScreen> {
  Uint8List? imageFile;
  bool? darkMode;
  Color? backgroundColor;
  final searchText = TextEditingController();
  List<String> formNameList = [];
  String? policeName;
  List<FormsClass> formList = [];
  String caseNo = '', police = '', location = '';
  final contollor = TextEditingController();

  @override
  void initState() {
    super.initState();
    dataReadFunctiond(widget.isarDBInstance);
    setState(() {
      imageFile = Uint8List.fromList(widget.user.imageBytes!);
      darkMode = widget.user.darkmode!;
      backgroundColor = darkMode == false ? Colors.white : Colors.black;
      policeName = widget.police;
    });
  }

  @override
  void dispose() {
    setState(() {
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
                                              setState(() {
                                                caseNo = formList[index]
                                                    .caseNo
                                                    .toString();

                                                location = formList[index]
                                                    .location
                                                    .toString();

                                                police = widget.police;
                                              });
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
                                                'lib/image_assets/doc.png')),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 1, right: 1),
                                      child: Text(
                                        formList[index].caseNo.toString(),
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
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: height / 15),
                          child: Container(
                            width: width / 2.2,
                            height: height,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                                //form
                                child: Container(
                              width: width / 2,
                              height: height,
                              decoration: BoxDecoration(
                                  color: darkMode == true
                                      ? Color(0xFFC9C9C9)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
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
                                      text: caseNo,
                                      padding: EdgeInsets.only(left: 5)),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  NameAndTextField(
                                      controller: contollor,
                                      enable: false,
                                      darkMode: darkMode!,
                                      height: height / 30,
                                      width: width / 5,
                                      fontsize: height / 65,
                                      name: 'Police :',
                                      text: police,
                                      padding: EdgeInsets.only(left: 5)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  NameAndTextField(
                                      controller: contollor,
                                      enable: false,
                                      darkMode: darkMode!,
                                      height: height / 30,
                                      width: width / 3,
                                      fontsize: height / 65,
                                      name: 'Location :',
                                      text: location,
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
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(left: width / 3),
                            child: ElevatedButton(
                              onPressed: () async {
                                /* Navigator.of(context).push(PageAnimationTransition(
                                  page: FormScreen(
                                    user: widget.user,
                                    isarDBInstance: widget.isarDBInstance,
                                    darkMode: darkMode!,
                                  ),
                                  pageAnimationType: FadeAnimationTransition()));*/

                                /*   Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FormScreen(
                                          user: widget.user,
                                          isarDBInstance: widget.isarDBInstance,
                                          darkMode: darkMode!,
                                        )),
                              );*/
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 10,
                                  fixedSize: Size(width / 15, height / 20),
                                  shadowColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor: darkMode == true
                                      ? Colors.blue
                                      : const Color(0xFF7D7D7D),
                                  foregroundColor: darkMode == true
                                      ? Colors.black
                                      : Colors.white,
                                  textStyle: TextStyle(
                                      fontSize: width / 90,
                                      fontWeight: FontWeight.bold)),
                              child: Text('Open'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 39.95, left: 108),
                  child: Container(
                    padding: EdgeInsets.only(left: 5),
                    alignment: Alignment.center,
                    width: 65,
                    height: 15,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Text(
                      '$policeName',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )),
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
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(PageAnimationTransition(
                              page: HoomeScreen(
                                user: widget.user,
                                isarDBInstance: widget.isarDBInstance,
                              ),
                              pageAnimationType: LeftToRightFadedTransition()));
                        },
                        child: Center(
                          child: Text(
                            '/Home /',
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.black, fontSize: 11),
                          ),
                        ),
                      )),
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

  Future<void> dataReadFunctiond(Isar isar) async {
    final formsResult = await isar.formsClass
        .filter()
        .userIDEqualTo(widget.user.id)
        .and()
        .policeEqualTo(widget.police)
        .findAll();

    if (await formsResult.isNotEmpty) {
      List<String> forSortNames = [];

      setState(() {
        for (int i = 0; i < formsResult.length; i++) {
          forSortNames.add(formsResult[i].caseNo.toString());
          formList.add(formsResult[i]);
        }
        forSortNames.sort();
        // formList.sort();

        for (int j = 0; j < forSortNames.length; j++) {
          formNameList.add(forSortNames[j]);
        }
      });
    }

    print(formList.first.caseNo);
  }
}