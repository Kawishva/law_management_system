import 'package:flutter/material.dart';
import 'package:law_management_system/components/user_email_paswd_component.dart';
import 'package:window_manager/window_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userName = TextEditingController();
  final userPassword = TextEditingController();

  @override
  void initState() {
    super.initState();

    windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(800, 600),
      maximumSize: Size(800, 600),
      minimumSize: Size(400, 300),
      center: true,
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void centerWindow() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFD6D6D6).withOpacity(1),
        body: SafeArea(
            child: Stack(
          children: [
            Align(
                alignment: const AlignmentDirectional(1.5, 0),
                child: Opacity(
                  opacity: 0.4,
                  child: Image.asset(
                    'lib/image_assets/login_background_image2.jpg',
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
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 30),
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
                          'LOGIN',
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
                              width: 25,
                              height: 7,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFFBC1307)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
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
                            print('Forgote Password');
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
                  opacity: 0.75,
                  child: ElevatedButton(
                    onPressed: () {
                      print('Go to register page.');
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
                        Icon(
                          Icons.app_registration_outlined,
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
