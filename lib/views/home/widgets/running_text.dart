import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee_text/marquee_text.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/colors.dart';
import 'package:get/get.dart';

class RunningText extends StatelessWidget {
   RunningText({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffFFFBEA),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      padding: REdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      // width: 300.w,
      child: MarqueeText(
        speed: 15,
        text: TextSpan(
          text: homeController.infoModel.value.data?.first.message??"No data Found",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
