import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/login_controller/login_controller.dart';
import 'package:flutter_application_1/controller/registration_controller/registration_controller.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/view/splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MYApp());
}

class MYApp extends StatelessWidget {
  const MYApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => registration_controller(),
        ),
        ChangeNotifierProvider(
          create: (context) => login_controller(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}