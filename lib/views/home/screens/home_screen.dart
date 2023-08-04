import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nondini_jewellery_admin/controller/home_controller.dart';
import 'package:nondini_jewellery_admin/utils/widgets/custom_button.dart';
import 'package:nondini_jewellery_admin/utils/widgets/customize_buttons.dart';
import 'package:nondini_jewellery_admin/views/add_product/add_products.dart';
import 'package:nondini_jewellery_admin/views/home/widgets/running_text.dart';
import 'package:nondini_jewellery_admin/views/update/update_product.dart';
import 'package:nondini_jewellery_admin/views/welcome/welcome_screen.dart';
import '../../../utils/colors.dart';
import '../../../utils/widgets/home_bottom_bar.dart';
import '../widgets/gold_bar_container.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    homeController.getProducts();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.fromLTRB(10, 16, 10, 0),
          child: Stack(
            children: [
              FutureBuilder<dynamic>(
                  future: homeController.getProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SingleChildScrollView(
                        child: Obx(
                          () => Column(
                            children: [
                              const RSizedBox(height: 20),
                              Container(
                                padding: REdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ListTile(
                                  leading: Text(
                                    "LIVE RATES",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  trailing: Text(
                                    "PRODUCTS",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const RSizedBox(height: 20),
                              // goldBar container
                              for (int i = 0;
                                  i <
                                      homeController
                                          .productsDataModel.value.data!.length;
                                  i++)
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GoldBarContainer(
                                        homeController.productsDataModel.value
                                                .data?[i].productName ??
                                            "",
                                        homeController.productsDataModel.value
                                                .data?[i].productQuantity ??
                                            "",
                                        homeController.productsDataModel.value
                                                .data?[i].productPrice ??
                                            ""),
                                     Padding(
                                          padding: REdgeInsets.symmetric(
                                                  horizontal: 10.0)
                                              .copyWith(
                                            top: 5,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  homeController.getStatusChange(
                                                      "${homeController.productsDataModel.value.data?[i].productId}");
                                                },
                                                child:
                                                homeController.productsDataModel.value.data?[i].status==1?
                                                Image.asset("assets/images/view.png",
                                                  width: 24.w,
                                                  color: const Color(0xff7d899b)):
                                                  Image.asset("assets/images/viewoff.png",
                                                  width: 24.w,
                                                  color: const Color(0xff7d899b)),
                                                ),
                                              const RSizedBox(width: 10),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(UpdateProducts(),
                                                      arguments: homeController
                                                          .productsDataModel
                                                          .value
                                                          .data?[i]
                                                          .productId);
                                                },
                                                child: Image.asset(
                                                  "assets/images/edit.png",
                                                  width: 24.w,
                                                  color: const Color(0xff7d899b),
                                                ),
                                              ),
                                              const RSizedBox(width: 10),
                                              GestureDetector(
                                                onTap: () {
                                                  homeController.deleteProducts(
                                                      homeController
                                                              .productsDataModel
                                                              .value
                                                              .data?[i]
                                                              .productId
                                                              .toString() ??
                                                          "-1");
                                                },
                                                child: Image.asset(
                                                  "assets/images/delete.png",
                                                  width: 24.w,
                                                  color: const Color(0xff7d899b),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    const RSizedBox(height: 5),
                                  ],
                                ),

                              CustomButton(
                                context,
                                'Add Your Products',
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddProducts(),
                                  ),
                                ),
                              ),

                              const RSizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WelcomeScreen(),
                                    ),
                                  );
                                },
                                child: RunningText(),
                              ),
                              // CustomizeButtons(
                              //   onView: () {},
                              //   onEdit: () {},
                              //   onDelete: () {},
                              // ),
                              const RSizedBox(height: 22),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                            color: AppColors.primaryColor),
                      );
                    }
                  }),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: HomeBottomBar(context)),
            ],
          ),
        ),
      ),
    );
  }
}
