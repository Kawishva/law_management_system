import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:law_management_system/screens/login_screen.dart';
import 'package:page_animation_transition/animations/left_to_right_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:window_manager/window_manager.dart';
import '../components/text_input_component.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final userName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  File? userImage;

  WindowOptions windowOptions = const WindowOptions(
      size: Size(960, 640), minimumSize: Size(800, 600), title: 'LMS');

  @override
  void initState() {
    super.initState();
    windowManager.ensureInitialized();
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
      await windowManager.setMaximizable(false);
      await windowManager.setResizable(false);
    });
  }

  @override
  void dispose() {
    windowManager.close();
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
                alignment: const AlignmentDirectional(-1, 0),
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
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 30),
                    width: 500,
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
                            'Email',
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
                              controller: email,
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
                              print('Name : ' +
                                  userName.text +
                                  ' \n Password :' +
                                  password.text);
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
                                          page: const LoginScreen(),
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
                          Text('Register'),
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
          ],
        )));
  }

  Future<void> userImagePickFunction() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png'],
        allowMultiple: false,
        allowCompression: false);

    if (result != null) {
      // Convert the FilePickerResult object to a File object.
      File file = File(result.files.single.path as String);
      setState(() {
        userImage = file;
      });
    } else {
      // User canceled the picker
      return;
    }
  }
}
