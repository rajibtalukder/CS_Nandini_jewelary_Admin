import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nondini_jewellery_admin/utils/colors.dart';
import 'package:nondini_jewellery_admin/utils/widgets/custom_button.dart';

import '../../controller/home_controller.dart';
import '../../utils/widgets/home_bottom_bar.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
   WelcomeScreen({Key? key}) : super(key: key);
  HomeController homeController = Get.find();


  @override
  Widget build(BuildContext context) {
    TextEditingController txtCtlr=
    TextEditingController(text: homeController.infoModel.value.data?.first.message);
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: REdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const RSizedBox(height: 30),
                    Center(
                      child: Text(
                        "Welcome to Nandini",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const RSizedBox(height: 30),
                    Container(
                      width: 328.w,
                      padding: REdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 0.50,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      child: TextFormField(
                        controller: txtCtlr,
                        decoration: InputDecoration(
                          contentPadding: REdgeInsets.symmetric(
                            vertical: 14,
                          ),
                          hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: AppColors.grayColor,
                          ),
                          border: InputBorder.none,

                        ),
                      ),
                    ),
                    // save button
                    const RSizedBox(height: 15),
                    CustomButton(context, "Save", () {
                      homeController.postInfo(msg: txtCtlr.text);
                    }),


                  ],
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: HomeBottomBar(context)),
        ],
      ),
    );
  }
}
