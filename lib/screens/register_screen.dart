import 'package:flutter/material.dart';
import 'package:law_management_system/screens/login_screen.dart';
import 'package:page_animation_transition/animations/left_to_right_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:window_manager/window_manager.dart';

import '../components/user_email_paswd_component.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final userName = TextEditingController();
  final userPassword = TextEditingController();

  WindowOptions windowOptions = const WindowOptions(
      size: Size(800, 600),
      // maximumSize: Size(800, 600),
      minimumSize: Size(800, 600),
      center: true,
      title: 'LMS');

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
                alignment: const AlignmentDirectional(-1.5, 0),
                child: Opacity(
                  opacity: 0.4,
                  child: Image.asset(
                    'lib/image_assets/login_background_image1.jpg',
                    filterQuality: FilterQuality.high,
                    isAntiAlias: true,
                    alignment: Alignment.centerRight,
                  ),
                )),
            /* Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Expanded(
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.7),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(5, 3),
                            )
                          ]),
                    ),
                  ),
                ),
              ),
            ),*/
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 30),
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        const Text(
                          'REGISTER',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontFamily: 'Aoboshi One',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 90),
                              width: 105,
                              height: 7,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFF160694)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 40,
                              height: 7,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFF160694)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        EmailPasswordField(
                            controller: userName,
                            prefixText: 'Name',
                            hintText: 'Enter User Name',
                            obscureText: false,
                            textInputType: TextInputType.text),
                        const SizedBox(
                          height: 10,
                        ),
                        EmailPasswordField(
                            controller: userPassword,
                            prefixText: 'Password',
                            hintText: 'Enter Password',
                            obscureText: true,
                            textInputType: TextInputType.text),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            print('Forgot Password');
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 135),
                            child: Text(
                              'Forgot Password ?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black.withOpacity(0.7)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print('Name : ' +
                                userName.text +
                                ' \n Password :' +
                                userPassword.text);
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
                                AssetImage('lib/image_assets/register_png.png'),
                                size: 20,
                              )
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
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 115),
                child: Opacity(
                  opacity: 0.7,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(PageAnimationTransition(
                          page: const LoginScreen(),
                          pageAnimationType: LeftToRightFadedTransition()));
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(250, 120),
                        elevation: 10,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                                width: 3, color: Colors.white)),
                        backgroundColor: const Color(0xFF160694),
                        textStyle: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Login'),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.login_rounded,
                          size: 50,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}
