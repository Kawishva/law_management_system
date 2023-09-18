import 'dart:io';
import 'dart:typed_data';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../isar_DB/entities/userSchema.dart';
import 'login_screen.dart';
import 'package:page_animation_transition/animations/left_to_right_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import '../components/text_input_component.dart';

class RegisterScreen extends StatefulWidget {
  final Isar isarDBInstance;

  RegisterScreen({super.key, required this.isarDBInstance});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final userName = TextEditingController();
  final passwordHint = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  File? userImage;
  Uint8List? imageBytesUnit8List;
  String? dropDownValue;

  List<String> questionList = [
    'pikachu',
    'charmander',
    'squirtle',
    'bullbasaur',
    'snorlax',
    'mankey',
    'psyduck',
    'meowth'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFD6D6D6).withOpacity(1),
        body: SafeArea(
            child: Stack(
          children: [
            Align(
                alignment: const AlignmentDirectional(-1.4, 0),
                child: Opacity(
                  opacity: 0.4,
                  child: Image.asset(
                    'lib/image_assets/login_background_image1.jpg',
                    filterQuality: FilterQuality.high,
                    isAntiAlias: true,
                    alignment: Alignment.centerRight,
                  ),
                )),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 40),
                child: Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(right: 30),
                    width: 600,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        const Align(
                          alignment: AlignmentDirectional(-0.9, 0),
                          child: Text(
                            'REGISTER',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: 'Aoboshi One',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-0.9, 0),
                          child: Container(
                            width: 80,
                            height: 5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFF160694)),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Align(
                          alignment: AlignmentDirectional(-0.9, 0),
                          child: Text(
                            'Name',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Aoboshi One',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-0.85, 0),
                          child: TextInputComponent(
                              controller: userName,
                              hintText: '',
                              obscureText: false,
                              textInputType: TextInputType.text),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Align(
                          alignment: AlignmentDirectional(-0.9, 0),
                          child: Text(
                            'Password',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Aoboshi One',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-0.85, 0),
                          child: TextInputComponent(
                              controller: password,
                              hintText: '',
                              obscureText: true,
                              textInputType: TextInputType.text),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Align(
                          alignment: AlignmentDirectional(-0.9, 0),
                          child: Text(
                            'Confirm Password',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Aoboshi One',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-0.85, 0),
                          child: TextInputComponent(
                              controller: confirmPassword,
                              hintText: '',
                              obscureText: true,
                              textInputType: TextInputType.text),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-0.85, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              newUserRegistration(
                                  widget.isarDBInstance, imageBytesUnit8List!);
                              userName.clear();
                              confirmPassword.clear();
                              passwordHint.clear();

                              password.clear();
                              setState(() {
                                userImage = null;
                                dropDownValue = null;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(230, 40),
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: const Color(0xFF160694),
                                textStyle: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left: 70),
                                    child: Text('Register')),
                                SizedBox(
                                  width: 50,
                                ),
                                ImageIcon(
                                  AssetImage(
                                      'lib/image_assets/register_png.png'),
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'If you already have an account',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black.withOpacity(0.7)),
                              ),
                              TextButton(
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
                                child: const Text(
                                  'Sign in',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      color: Color(0xFF160694)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.83, 0),
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 60,
                      backgroundImage: userImage == null
                          ? AssetImage('lib/image_assets/userDp.png')
                          : Image.file(userImage!).image,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        userImagePickFunction();
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 30),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: const Color(0xFF160694),
                          textStyle: const TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Upload'),
                          SizedBox(
                            width: 4,
                          ),
                          Icon(
                            Icons.upload_rounded,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.86, -0.7),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      userImage = null;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(30, 30),
                      elevation: 10,
                      shape: CircleBorder(),
                      backgroundColor: Colors.white,
                      textStyle: const TextStyle(
                          fontSize: 11, fontWeight: FontWeight.bold)),
                  child: Icon(
                    Icons.delete,
                    color: Color(0xFF940606),
                    size: 25,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 590, bottom: 210),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Passwor Rest Hint',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Aoboshi One',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    width: 300,
                    height: 35,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xFF7D7D7D)),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton<String>(
                      value: dropDownValue != null
                          ? dropDownValue
                          : questionList.first,
                      focusColor: Colors.amber,
                      dropdownColor: Colors.white,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                      underline: SizedBox(),
                      isExpanded: true,
                      icon: Icon(
                        Icons.question_answer_sharp,
                        size: 20,
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          dropDownValue = newValue;
                        });
                      },
                      items: questionList.map((valueItem) {
                        return DropdownMenuItem(
                            value: valueItem, child: Text(valueItem));
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextInputComponent(
                      controller: passwordHint,
                      hintText: '',
                      obscureText: false,
                      textInputType: TextInputType.text),
                ],
              ),
            ),
          ],
        )));
  }

  Future<void> userImagePickFunction() async {
    const XTypeGroup typeGroup = XTypeGroup(
      label: 'jpg,png',
      extensions: <String>['jpg', 'png'],
    );
    final XFile? fileImage = await openFile(
      acceptedTypeGroups: <XTypeGroup>[typeGroup],
    );

    if (fileImage != null) {
      // Convert the FilePickerResult object to a File object.
      // Uint8List? fileBytes = result.files.single.bytes;
      File file = File(fileImage.path);
      Uint8List imageBytes = await file.readAsBytes();

      setState(() {
        userImage = file;
        imageBytesUnit8List = imageBytes;
      });
    } else {
      // User canceled the picker
      return;
    }
  }

  void validationFunction() {}

  Future<void> newUserRegistration(
      Isar isar, Uint8List imageIntByteList) async {
    List<int> byteList =
        imageBytesUnit8List!.toList().map((value) => value & 0xFF).toList();

    final newUser = UsersClass()
      ..name = userName.text
      ..password = password.text
      ..question = dropDownValue == null ? questionList.first : dropDownValue
      ..passwordRestHint = passwordHint.text
      ..imageBytes = byteList;

    await isar.writeTxn(() async {
      await isar.usersClass.put(newUser);
    });
  }
}
