import 'dart:io';
import 'dart:typed_data';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:isar/isar.dart';
import 'package:law_management_system/isar_DB/entities/docFilesSchema.dart';
import 'package:law_management_system/isar_DB/entities/formSchema.dart';
import 'package:page_animation_transition/animations/fade_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:window_manager/window_manager.dart';
import '../components/form_components/name&textfield.dart';
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
  List<File> userFiles = [];
  List<XFile> importedFilesList = [];

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
                child: Container(
              width: width / 2,
              height: height,
              decoration: BoxDecoration(
                color:
                    widget.darkMode == true ? Color(0xFFC9C9C9) : Colors.white,
              ),
              child: ListView(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Form',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  NameAndTextField(
                      controller: caseNo,
                      enable: true,
                      darkMode: widget.darkMode,
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
                      controller: police,
                      enable: true,
                      darkMode: widget.darkMode,
                      height: height / 30,
                      width: width / 5,
                      fontsize: height / 65,
                      name: 'Police :',
                      text: '',
                      padding: EdgeInsets.only(left: 5)),
                  SizedBox(
                    height: 5,
                  ),
                  NameAndTextField(
                      controller: location,
                      enable: true,
                      darkMode: widget.darkMode,
                      height: height / 30,
                      width: width / 3,
                      fontsize: height / 65,
                      name: 'Location :',
                      text: '',
                      padding: EdgeInsets.only(left: 5)),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: width / 20, right: width / 20),
                    child: Container(
                      height: height / 3,
                      decoration: BoxDecoration(
                          color: widget.darkMode == true
                              ? Color.fromARGB(255, 99, 99, 99).withOpacity(0.5)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10)),
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
                          itemCount: userFiles.length + 1,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0, bottom: 8),
                                    child: Container(
                                      padding: EdgeInsets.all(1),
                                      width: width / 20,
                                      height: height / 10,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            index == 0
                                                ? userFilePickFunction()
                                                : print(
                                                    importedFilesList[index - 1]
                                                        .name);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              alignment: Alignment.center,
                                              side: index != 0
                                                  ? null
                                                  : BorderSide(
                                                      width: 1.5,
                                                      strokeAlign: BorderSide
                                                          .strokeAlignOutside,
                                                      color: widget.darkMode == true
                                                          ? Colors.black
                                                              .withOpacity(0.6)
                                                          : Color(0xFF7D7D7D)),
                                              padding: EdgeInsets.only(
                                                  bottom: height / 60,
                                                  right: width / 900),
                                              elevation: 0,
                                              backgroundColor:
                                                  widget.darkMode == true
                                                      ? Colors.transparent
                                                      : Colors.grey
                                                          .withOpacity(0.2),
                                              shadowColor: Colors.transparent,
                                              foregroundColor:
                                                  widget.darkMode == true
                                                      ? Colors.black
                                                      : Colors.grey,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10))),
                                          child: index == 0
                                              ? Icon(
                                                  Icons.note_add_rounded,
                                                  size: width / 20,
                                                )
                                              : importedFilesList[index - 1].name.endsWith('.pdf')
                                                  ? Image.asset('lib/image_assets/pdf.png')
                                                  : Image.file(userFiles[index - 1])),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: index == 0
                                      ? null
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                              left: 1, right: 1),
                                          child: Text(
                                            importedFilesList[index - 1].name,
                                            style: TextStyle(
                                                fontSize: width / 150,
                                                color: Colors.black,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 2),
                                    child: index == 0
                                        ? null
                                        : Container(
                                            width: width / 65,
                                            height: width / 65,
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    userFiles
                                                        .removeAt(index - 1);
                                                    importedFilesList
                                                        .removeAt(index - 1);
                                                  });
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.only(
                                                        bottom: height / 60,
                                                        right: width / 1000),
                                                    elevation: 2,
                                                    backgroundColor:
                                                        widget.darkMode == true
                                                            ? Colors.blue
                                                            : const Color(
                                                                0xFF7D7D7D),
                                                    foregroundColor:
                                                        widget.darkMode == true
                                                            ? Colors.black
                                                            : Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50))),
                                                child: Icon(
                                                  Typicons.cancel_outline,
                                                  size: width / 85,
                                                )),
                                          ),
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
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
                            onPressed: () {
                              addDetatilsFuntion(widget.isarDBInstance);
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
                              setState(() {
                                userFiles.clear();
                                importedFilesList.clear();
                                caseNo.clear();
                                police.clear();
                                location.clear();
                              });
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

  Future<void> userFilePickFunction() async {
    const XTypeGroup jpgsTypeGroup = XTypeGroup(
      label: 'JPEGs,PDFs,PDFs',
      extensions: <String>['jpg', 'jpeg', 'png', 'pdf'],
    );

    final List<XFile> files = await openFiles(acceptedTypeGroups: <XTypeGroup>[
      jpgsTypeGroup,
    ]);

    if (files.isNotEmpty) {
      setState(() {
        for (int i = 0; i < files.length; i++) {
          File filePath = File(files[i].path);
          userFiles.add(filePath); //converting them ass files
          importedFilesList.add(files[i]);
        }

        files.clear();
      });
    } else {
      // User canceled the picker
      return;
    }
  }

  Future<void> addDetatilsFuntion(Isar isar) async {
    List<List<int>> fileConvertedByteList = [];

    for (int i = 0; i < userFiles.length; i++) {
      Uint8List fileByte = await userFiles[i].readAsBytes();

      List<int> byteList =
          fileByte.toList().map((value) => value & 0xFF).toList();

      fileConvertedByteList.add(byteList);
    }

    final newForm = FormsClass()
      ..userID = widget.user!.id
      ..caseNo = caseNo.text.toLowerCase()
      ..police = police.text.toLowerCase()
      ..location = location.text.toLowerCase();

    await isar.writeTxn(() async {
      await isar.formsClass.put(newForm);
    });

    for (int j = 0; j < fileConvertedByteList.length; j++) {
      final newdocFile = DocFIlesClass()
        ..userID = widget.user!.id
        ..docName = importedFilesList[j].name
        ..caseNo = caseNo.text
        ..documentBytes = fileConvertedByteList[j];

      await isar.writeTxn(() async {
        await isar.docFIlesClass.put(newdocFile);
      });
    }
    setState(() {
      userFiles.clear();
      importedFilesList.clear();
      caseNo.clear();
      police.clear();
      location.clear();
    });
  }
}
