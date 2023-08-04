import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nondini_jewellery_admin/controller/home_controller.dart';
import 'package:nondini_jewellery_admin/views/home/screens/home_screen.dart';
import 'package:nondini_jewellery_admin/views/phone/screens/phone_screen.dart';
import 'package:nondini_jewellery_admin/views/splash/screen/splash_screen.dart';
import 'package:nondini_jewellery_admin/views/whatsapp/screens/whatsapp_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // disable landscape mode
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}
