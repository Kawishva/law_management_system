import 'dart:io';
import 'dart:typed_data';
import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:isar/isar.dart';
import 'package:law_management_system/isar_DB/entities/docFilesSchema.dart';
import 'package:law_management_system/isar_DB/entities/formSchema.dart';
import 'package:law_management_system/isar_DB/entities/userSchema.dart';
import 'package:law_management_system/screens/home_screen.dart';
import 'package:page_animation_transition/animations/left_to_right_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
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
  String? policeName;
  List<FormsClass> formList = [];
  List<int> deleteFormList = [];
  List<DocFIlesClass> docFilesList = [];
  List<String> deleteDocList = [];
  String caseNo = '', police = '', location = '';
  final contollor = TextEditingController();
  File? file;

  @override
  void initState() {
    super.initState();
    dataReadCaseFilesFunction(widget.isarDBInstance);
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
      deleteFormList.clear();
      formList.clear();
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
                            itemCount: formList.length,
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
                                        child: GestureDetector(
                                          onDoubleTap: () {
                                            print('2 taps');
                                          },
                                          child: ElevatedButton(
                                              onPressed: () {
                                                dataReadDocFilesFunction(
                                                    widget.isarDBInstance,
                                                    formList[index]
                                                        .caseNo
                                                        .toString());
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
                                                  shadowColor:
                                                      Colors.transparent,
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
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 2),
                                      child: Container(
                                        width: width / 75,
                                        height: width / 75,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                deleteFormList.add(
                                                    formList[index].caseId);
                                                deleteDocList.add(
                                                    formList[index]
                                                        .caseNo
                                                        .toString());
                                                formList.removeAt(index);
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.only(
                                                  bottom: height / 60,
                                                ),
                                                elevation: 2,
                                                backgroundColor: darkMode ==
                                                        true
                                                    ? Colors.red
                                                    : const Color(0xFF7D7D7D),
                                                foregroundColor:
                                                    darkMode == true
                                                        ? Colors.black
                                                        : Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50))),
                                            child: Icon(
                                              Typicons.cancel_outline,
                                              size: width / 90,
                                            )),
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
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: darkMode == true
                                    ? Color(0xFFC9C9C9)
                                    : Colors.white,
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
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: width / 20, right: width / 20),
                                  child: Container(
                                    height: height / 3,
                                    decoration: BoxDecoration(
                                        color: darkMode == true
                                            ? Color.fromARGB(255, 99, 99, 99)
                                                .withOpacity(0.5)
                                            : Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: GridView.builder(
                                        primary: false,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount:
                                              6, // Adjust the number of columns as needed
                                          crossAxisSpacing: 1,
                                          mainAxisSpacing: 10,
                                        ),
                                        itemCount: docFilesList.length,
                                        itemBuilder: (context, index) {
                                          return Stack(
                                            children: [
                                              Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 0, bottom: 8),
                                                  child: Container(
                                                    padding: null,
                                                    width: width / 20,
                                                    height: height / 10,
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        openPDFinBrowser(
                                                            docFilesList[index]
                                                                .documentBytes!,
                                                            docFilesList[index]
                                                                .docName
                                                                .toString());
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                          alignment:
                                                              Alignment.center,
                                                          padding:
                                                              EdgeInsets.only(),
                                                          elevation: 0,
                                                          backgroundColor:
                                                              darkMode == true
                                                                  ? Colors
                                                                      .transparent
                                                                  : Colors.grey
                                                                      .withOpacity(
                                                                          0.2),
                                                          shadowColor: Colors
                                                              .transparent,
                                                          foregroundColor:
                                                              darkMode == true
                                                                  ? Colors.black
                                                                  : Colors.grey,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0))),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 10),
                                                        child:
                                                            docFilesList[index]
                                                                    .docName
                                                                    .toString()
                                                                    .endsWith(
                                                                        '.pdf')
                                                                ? Padding(
                                                                    padding: EdgeInsets.only(
                                                                        bottom: height /
                                                                            500),
                                                                    child: Image
                                                                        .asset(
                                                                      'lib/image_assets/pdf.png',
                                                                    ),
                                                                  )
                                                                : Padding(
                                                                    padding: EdgeInsets
                                                                        .all(width /
                                                                            200),
                                                                    child: Image
                                                                        .memory(
                                                                            Uint8List.fromList(docFilesList[index].documentBytes!)),
                                                                  ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 1, right: 1),
                                                  child: Text(
                                                    docFilesList[index]
                                                        .docName
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: width / 150,
                                                        color: Colors.black,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(left: width / 3),
                            child: ElevatedButton(
                              onPressed: () {},
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
                          dataDeleteFunction(widget.isarDBInstance);
                          if (file != null) {
                            file!.delete();
                          }

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
                        dataSearchCaseFilesFunction(widget.isarDBInstance);
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

  Future<void> dataReadCaseFilesFunction(Isar isar) async {
    setState(() {
      formList.clear();
    });

    final formsResult = await isar.formsClass
        .filter()
        .userIDEqualTo(widget.user.id)
        .and()
        .policeEqualTo(widget.police)
        .findAll();

    if (await formsResult.isNotEmpty) {
      setState(() {
        for (int i = 0; i < formsResult.length; i++) {
          formList.add(formsResult[i]);
        }
      });
    }
  }

  Future<void> dataReadDocFilesFunction(Isar isar, String caseNo) async {
    setState(() {
      docFilesList.clear();
    });
    final docFilesResult = await isar.docFIlesClass // Correct schema name
        .filter()
        .userIDEqualTo(widget.user.id)
        .and()
        .caseNoEqualTo(caseNo)
        .findAll();

    if (await docFilesResult.isNotEmpty) {
      setState(() {
        for (int j = 0; j < docFilesResult.length; j++) {
          docFilesList.add(docFilesResult[j]);
        }
      });
    }
  }

  Future<void> dataDeleteFunction(Isar isar) async {
    await isar.writeTxn(() async {
      await isar.formsClass.deleteAll(deleteFormList);
    });
    for (int i = 0; i < deleteDocList.length; i++) {
      await isar.writeTxn(() async {
        await isar.docFIlesClass
            .filter()
            .caseNoEqualTo(deleteDocList[i])
            .deleteAll();
      });
    }

    setState(() {
      deleteDocList.clear();
      deleteFormList.clear();
    });
  }

  Future<void> openPDFinBrowser(List<int> pdfBytes, String fileName) async {
    if (file != null) {
      file!.delete();
    }

    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$fileName';

    file = File(filePath);
    await file!.writeAsBytes(pdfBytes);
    await launchUrl(file!.uri);
  }

  Future<void> dataSearchCaseFilesFunction(Isar isar) async {
    setState(() {
      formList.clear();
      docFilesList.clear();
      caseNo = '';
      police = '';
      location = '';
    });

    final formsResult = await isar.formsClass
        .filter()
        .userIDEqualTo(widget.user.id)
        .and()
        .policeEqualTo(widget.police)
        .and()
        .caseNoEqualTo(searchText.text)
        .or()
        .locationEqualTo(searchText.text)
        .findAll();

    if (await formsResult.isNotEmpty) {
      setState(() {
        for (int i = 0; i < formsResult.length; i++) {
          formList.add(formsResult[i]);
        }
      });
    } else if (searchText.text.isEmpty) {
      dataReadCaseFilesFunction(isar);
    }

    dataDeleteFunction(isar);
  }
}
