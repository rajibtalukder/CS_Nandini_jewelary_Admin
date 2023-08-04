import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nondini_jewellery_admin/utils/widgets/customize_buttons.dart';
import '../../../controller/home_controller.dart';
import '../../../utils/widgets/add_custom_button.dart';
import '../../../utils/widgets/custom_button.dart';
import '../../../utils/widgets/custom_field.dart';
import '../../../utils/widgets/home_bottom_bar.dart';
import '../../../utils/widgets/whatsapp_bottombar.dart';
import 'package:get/get.dart';

class WhatsappScreen extends StatefulWidget {
   WhatsappScreen({Key? key}) : super(key: key);

  @override
  State<WhatsappScreen> createState() => _WhatsappScreenState();
}

class _WhatsappScreenState extends State<WhatsappScreen> {
  HomeController homeController = Get.put(HomeController());

  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    TextEditingController wpCtlr=
    TextEditingController(text: homeController.infoModel.value.data?.first.whatsapp);

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
                        "WhatsApp Number Edit",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const RSizedBox(height: 40),
                    Text(
                      "Whatsapp Number",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const RSizedBox(height: 10),
                    // whatsapp field
                    customField('+88017777777', wpCtlr, "assets/images/wp.png"),

                    // CustomizeButtons(
                    //   onView: () {},
                    //   onEdit: () {},
                    //   onDelete: () {},
                    // ),
                    const RSizedBox(height: 40),
                    // update whatsapp number
                    CustomButton(context, "Update Your Whatsapp Number", () {
                      homeController.postInfo(wp: wpCtlr.text);
                    }),
                    const RSizedBox(height: 250),
                    //const WhatsappBottomBar(),
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: WhatsappBottomBar(context)),
          ],
        ),
      ),
    );
  }
}
