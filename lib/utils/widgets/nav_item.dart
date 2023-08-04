import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors.dart';

class NavItem extends StatelessWidget {
  final String itemImage;
  final String itemTitle;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItem({
    Key? key,
    required this.itemImage,
    required this.itemTitle,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 120.h,
          decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primaryColor
                  : AppColors.secondaryColor,
              // borderRadius: const BorderRadius.only(
              //   topLeft: Radius.circular(10),
              //   bottomLeft: Radius.circular(10),
              // ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                itemImage,
                width: 25.w,
                color: isSelected ? Colors.white : AppColors.accentColor,
              ),
              const RSizedBox(height: 5),
              Text(
                itemTitle,
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: isSelected ? Colors.white : AppColors.accentColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
