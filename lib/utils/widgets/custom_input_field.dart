
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';

Widget customInputField(String hintText,TextEditingController controller) {
    return Container(
      height: 56.h,
      width: 328.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border:
            Border.all(
              width: 0.50,
              color: const Color(0xFFB2BEC7),
            ),
      ),
      child: TextFormField(
        validator: (value){
          if(value!.isEmpty){
            return 'Field is required';
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          contentPadding: REdgeInsets.symmetric(
            vertical: 14,horizontal: 14
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: AppColors.grayColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

