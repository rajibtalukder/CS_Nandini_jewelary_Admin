import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';

Widget addCustomButtom(BuildContext context,String text, {VoidCallback? onclick}){
  return TextButton(
    onPressed:onclick ,
    style: TextButton.styleFrom(
        elevation: 0,
        minimumSize: Size(328.w, 50.h),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side:  const BorderSide(color: AppColors.primaryColor,width: 1)
        )),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.add,color: Colors.white),
        const RSizedBox(width: 10),

        Text(text,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}