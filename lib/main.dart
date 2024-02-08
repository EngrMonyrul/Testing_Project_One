import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testingprojectone/core/views/homePage/home_page.dart';
import 'package:testingprojectone/utils/themes/app_base_theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppBaseTheme.lightAppTheme,
      darkTheme: AppBaseTheme.darkAppTheme,
      home: const HomePage(),
    );
  }
}
