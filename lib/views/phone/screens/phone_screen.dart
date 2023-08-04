import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controller/home_controller.dart';
import '../../../utils/widgets/add_custom_button.dart';
import '../../../utils/widgets/custom_button.dart';
import '../../../utils/widgets/custom_field.dart';
import '../../../utils/widgets/customize_buttons.dart';
import '../../../utils/widgets/home_bottom_bar.dart';
import '../../../utils/widgets/phone_bottombar.dart';
import 'package:get/get.dart';

class PhoneScreen extends StatelessWidget {
   PhoneScreen({Key? key}) : super(key: key);
   HomeController homeController = Get.find();

   @override
  Widget build(BuildContext context) {
    TextEditingController phCtlr=
    TextEditingController(text: homeController.infoModel.value.data?.first.phone);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: REdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RSizedBox(height: 40),
                    Center(
                      child: Text(
                        "Phone Number Edit",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const RSizedBox(height: 40),
                    Text(
                      "Phone Number",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const RSizedBox(height: 10),
                    // whatsapp field
                    customField("+88017777777", phCtlr, "assets/images/ph.png"),

                    // CustomizeButtons(
                    //   onView: () {},
                    //   onEdit: () {},
                    //   onDelete: () {},
                    // ),
                    const RSizedBox(height: 40),
                    // update whatsapp number
                    CustomButton(context, "Update Your Phone Number", () {
                      homeController.postInfo(phn: phCtlr.text);
                    }),
                    //const PhoneBottomBar(),
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: PhoneBottomBar(context)),
          ],
        ),
      ),
    );
  }
}
