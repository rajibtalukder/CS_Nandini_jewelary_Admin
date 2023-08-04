import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nondini_jewellery_admin/utils/colors.dart';
import 'package:page_transition/page_transition.dart';

import '../../home/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Text(
          "Nandini Jewellery",
          textAlign: TextAlign.center,
          style: GoogleFonts.sonsieOne(
            fontSize: 32.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      nextScreen: const HomeScreen(),
      splashIconSize: 500.sp,
      pageTransitionType: PageTransitionType.fade,
      splashTransition: SplashTransition.fadeTransition,
      duration: 200,
      animationDuration:  const Duration(milliseconds: 500),
    );
  }
}
