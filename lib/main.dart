import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:law_management_system/isar_DB/entities/userSchema.dart';

import 'package:window_manager/window_manager.dart';
import 'screens/login_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  final dir = await getApplicationSupportDirectory();
  final isar =
      await Isar.open([UsersClassSchema], directory: dir.path, inspector: true);

  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
      size: Size(960, 640),
      minimumSize: Size(800, 600),
      // center: true,
      title: 'LMS');

  windowManager.ensureInitialized();

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
    await windowManager.setMaximizable(false);
    await windowManager.setResizable(false);
    await windowManager.center();
  });

  runApp(MyApp(
    isarDBInstance: isar,
  ));
}

class MyApp extends StatelessWidget {
  final Isar isarDBInstance;
  MyApp({super.key, required this.isarDBInstance});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: LoginScreen(
        isarDBInstance: isarDBInstance,
      ),
    );
  }
}
