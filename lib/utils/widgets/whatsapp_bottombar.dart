import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../views/home/screens/home_screen.dart';
import '../../views/phone/screens/phone_screen.dart';
import '../../views/whatsapp/screens/whatsapp_screen.dart';
import 'package:get/get.dart';
import '../colors.dart';
import 'nav_item.dart';

Widget WhatsappBottomBar(BuildContext context) {
  return Container(
    margin: REdgeInsets.symmetric(
      horizontal: 10,
      vertical: 16,
    ),
    height: 60.h,
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.secondaryColor,
      borderRadius: BorderRadius.circular(8),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // home
          NavItem(
            itemImage: "assets/images/live-rates.png",
            itemTitle: "Live Rates",
            isSelected: false,
            onTap: () {
              Get.offAll(HomeScreen());
              print("=============");
            },
          ),
          // whatsapp
          NavItem(
            itemImage: "assets/images/wp.png",
            itemTitle: "Whatsapp",
            isSelected: true,
            onTap: () {
              Get.offAll(WhatsappScreen());            },
          ),
          // phone
          NavItem(
            itemImage: "assets/images/ph.png",
            itemTitle: "Phone",
            isSelected: false,
            onTap: () {
              Get.offAll(PhoneScreen());
            },
          ),
        ],
      ),
    ),
  );
}
