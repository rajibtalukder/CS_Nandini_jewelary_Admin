import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomizeButtons extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onView;
  final VoidCallback onDelete;

  const CustomizeButtons({
    Key? key,
    required this.onView,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 10.0).copyWith(
        top: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: onView,
            child: Image.asset(
              "assets/images/view.png",
              width: 24.w,
              color: const Color(0xff7d899b),
            ),
          ),
          const RSizedBox(width: 10),
          GestureDetector(
            onTap: onEdit,
            child: Image.asset(
              "assets/images/edit.png",
              width: 24.w,
              color: const Color(0xff7d899b),
            ),
          ),
          const RSizedBox(width: 10),
          GestureDetector(
            onTap: onDelete,
            child: Image.asset(
              "assets/images/delete.png",
              width: 24.w,
              color: const Color(0xff7d899b),
            ),
          ),
        ],
      ),
    );
  }
}
