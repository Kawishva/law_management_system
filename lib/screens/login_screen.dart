import 'package:flutter/material.dart';
import 'package:law_management_system/components/text_input_component.dart';
import 'package:page_animation_transition/animations/right_to_left_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:window_manager/window_manager.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userName = TextEditingController();
  final userPassword = TextEditingController();

  WindowOptions windowOptions = const WindowOptions(
      size: Size(960, 640),
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
                alignment: const AlignmentDirectional(1, 0),
                child: Opacity(
                  opacity: 0.4,
                  child: Image.asset(
                    'lib/image_assets/login_background_image2.jpg',
                    alignment: Alignment.centerRight,
                    filterQuality: FilterQuality.high,
                    isAntiAlias: true,
                  ),
                )),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 40),
                    width: 340,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /* const SizedBox(
                          height: 100,
                        ),*/
                        const Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontFamily: 'Aoboshi One',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 25,
                              height: 7,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFFBC1307)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              width: 70,
                              height: 7,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFFBC1307)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextInputComponent(
                            controller: userName,
                            hintText: 'Enter User Name',
                            obscureText: false,
                            textInputType: TextInputType.text),
                        const SizedBox(
                          height: 10,
                        ),
                        TextInputComponent(
                            controller: userPassword,
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
                              backgroundColor: const Color(0xFFBC1307),
                              textStyle: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 80),
                                  child: Text('Login')),
                              SizedBox(
                                width: 60,
                              ),
                              Icon(Icons.login_rounded)
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
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 115),
                child: Opacity(
                  opacity: 0.7,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(PageAnimationTransition(
                          page: const RegisterScreen(),
                          pageAnimationType: RightToLeftFadedTransition()));
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(250, 120),
                        elevation: 10,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                                width: 3, color: Colors.white)),
                        backgroundColor: const Color(0xFFBC1307),
                        textStyle: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Register'),
                        SizedBox(
                          width: 15,
                        ),
                        ImageIcon(
                          AssetImage('lib/image_assets/register_png.png'),
                          size: 35,
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
