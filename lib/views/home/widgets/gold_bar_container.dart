import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';
import '../../../utils/widgets/customize_buttons.dart';

Widget GoldBarContainer(
  String barName,
  String barUnit,
  String barPrice,
) {
  return Container(
    padding: REdgeInsets.symmetric(
      vertical: 15,
    ),
    decoration: BoxDecoration(
      color: AppColors.secondaryColor,
      borderRadius: BorderRadius.circular(8),
    ),
    child: IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            barName,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.textColor,
            ),
          ),
          const VerticalDivider(),
          Text(
            barUnit,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.secondaryTextColor,
            ),
          ),
          const VerticalDivider(),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: barPrice,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor,
                  ),
                ),
                TextSpan(
                  text: "TK",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
