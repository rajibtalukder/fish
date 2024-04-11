import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'facebook_login_ui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    print("object");
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyB-Eovv0p_6A3n5GGOcXQBjGIPI3T1tDFw",
      appId: "1:808113835137:web:52a65a2b8e8fabcfc85180",
      messagingSenderId: "808113835137",
      projectId: "facebooklog-4fe38",
    ));
    print("Connected");
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: FacebookLoginResponsiveUI(),
          );
        });
  }
}
