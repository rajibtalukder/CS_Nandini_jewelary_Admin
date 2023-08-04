import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';

Widget CustomButton(BuildContext context, String btnText, Function()? onClick,
    {IconData? icn}) {
  return ElevatedButton(

    onPressed: onClick,
    style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: Size(328.w, 50.h),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        )),
    child: Text(
      btnText,
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
