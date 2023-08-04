import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';

Widget customField(String hintText, TextEditingController controller,String fieldImage ){
  return Container(
    width: 328.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
            width: 0.50,
            color: const Color(0xFFB2BEC7),
          ),
    ),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: REdgeInsets.symmetric(
          vertical: 14,
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 20,
          color: AppColors.grayColor,
        ),
        border: InputBorder.none,
        prefixIcon: Padding(
          padding: REdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Image.asset(
            fieldImage,
            width: 24.w,
            color: const Color(0xFFB2BEC7),
          ),
        ),
      ),
    ),
  );
}
