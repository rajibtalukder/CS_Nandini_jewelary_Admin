import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nondini_jewellery_admin/controller/home_controller.dart';
import 'package:nondini_jewellery_admin/utils/colors.dart';
import 'package:nondini_jewellery_admin/utils/widgets/custom_button.dart';
import 'package:nondini_jewellery_admin/utils/widgets/custom_input_field.dart';

import '../../utils/widgets/custom_field.dart';
import '../../utils/widgets/home_bottom_bar.dart';
import 'package:get/get.dart';

class UpdateProducts extends StatefulWidget {
  UpdateProducts({Key? key}) : super(key: key);

  @override
  State<UpdateProducts> createState() => _UpdateProductsState();
}

class _UpdateProductsState extends State<UpdateProducts> {
  int argsIndex = Get.arguments;
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    var data = homeController.productsDataModel.value.data
        ?.firstWhere((element) => element.productId == argsIndex);
    TextEditingController nameCtlr = TextEditingController(text: data?.productName);
    TextEditingController qntCtlr = TextEditingController(text: data?.productQuantity);
    TextEditingController priceCtlr = TextEditingController(text: data?.productPrice);
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RSizedBox(height: 15),
                    Center(
                      child: Text(
                        "Update Your Products",
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
                    CustomButton(context, 'Update Your Product', () {
                      homeController.editProducts(
                          nameCtlr.text, priceCtlr.text, qntCtlr.text,data!.productId.toString());
                    }),

                  ],
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
