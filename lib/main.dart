import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinnovate_task/Appconst/appcolors.dart';
import 'package:vinnovate_task/view/auth/login_screen.dart';
import 'package:vinnovate_task/viewmodel/initBinding.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(color: AppcColors.txtgrey,
      title: 'Flutter Demo',
      theme: ThemeData(backgroundColor: AppcColors.txtgrey,
        colorScheme: ColorScheme.fromSeed(seedColor: AppcColors.white,background: AppcColors.white,onBackground: AppcColors.white),
        useMaterial3: false,primaryColor: AppcColors.txtgrey,
      ),
      home: const Loginscreen(),
        initialBinding: InitiBinding(),
    );
  }
}


