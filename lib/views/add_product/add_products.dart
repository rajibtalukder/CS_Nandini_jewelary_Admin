import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nondini_jewellery_admin/controller/home_controller.dart';
import 'package:nondini_jewellery_admin/utils/widgets/custom_button.dart';
import 'package:nondini_jewellery_admin/utils/widgets/custom_input_field.dart';
import '../../utils/widgets/home_bottom_bar.dart';
import 'package:get/get.dart';

class AddProducts extends StatefulWidget {
  AddProducts({Key? key}) : super(key: key);

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  HomeController homeController = Get.put(HomeController());

  TextEditingController nameCtlr = TextEditingController();
  TextEditingController qntCtlr = TextEditingController();
  TextEditingController priceCtlr = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: REdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const RSizedBox(height: 15),
                      Center(
                        child: Text(
                          "Add Your Products",
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const RSizedBox(height: 15),
                      Text(
                        "Gold Name",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const RSizedBox(height: 15),
                      customInputField('Gold Name', nameCtlr),
                      const RSizedBox(height: 20),
                      Text(
                        "Per Bhori",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const RSizedBox(height: 15),
                      customInputField('Per Bhori', qntCtlr),
                      const RSizedBox(height: 20),
                      Text(
                        "Gold Tk",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const RSizedBox(height: 15),
                      customInputField('Gold Tk', priceCtlr),
                      const RSizedBox(height: 20),
                      CustomButton(context, 'Add Your Product', () {
                        if (formkey.currentState!.validate()) {
                          homeController.postProducts(
                              nameCtlr.text, priceCtlr.text, qntCtlr.text);
                        }
                      }),
                      const RSizedBox(height: 20),
                      /*TextButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            homeController.postProducts(
                                nameCtlr.text, priceCtlr.text, qntCtlr.text);
                          }
                        },
                        style: TextButton.styleFrom(
                            elevation: 0,
                            minimumSize: Size(328.w, 50.h),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                    color: AppColors.primaryColor, width: 1))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.add,
                                color: AppColors.primaryColor),
                            const RSizedBox(width: 10),
                            Text(
                              'Add Your Products',
                              style: GoogleFonts.poppins(
                                color: AppColors.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),*/
                      const RSizedBox(height: 20),
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
      ),
    );
  }
}
