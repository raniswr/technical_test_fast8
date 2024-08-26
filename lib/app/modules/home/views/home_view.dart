import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:technical_test_fast8/app/constant/colors.dart';
import 'package:technical_test_fast8/app/routes/app_pages.dart';
import 'package:technical_test_fast8/app/widget/custom_bottomsheet.dart';

import 'package:technical_test_fast8/app/widget/item_widget.dart';
import 'package:technical_test_fast8/app/constant/styles.dart';
import 'package:technical_test_fast8/app/modules/home/views/widgets/explore_wellness.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(), // Initialize the controller
      builder: (controller) {
        return Scaffold(
            backgroundColor: AppColors.primary,
            appBar: AppBar(
              backgroundColor: AppColors.primary,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Sore',
                    style: AppStyles.styleTextBody18(colorText: AppColors.white),
                  ),
                  Text(
                    'Rani',
                    style: AppStyles.styleTextBody18(colorText: AppColors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              actions: [
                const Icon(
                  Icons.notifications_none_outlined,
                  size: 40,
                  color: AppColors.white,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.INFORMASI);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.grayDark,
                    ),
                    child: Center(
                      child: Text(
                        'R',
                        style: AppStyles.styleTextBody25(colorText: AppColors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            body: Stack(
              children: [
                const SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 200,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Payuung Pribadi',
                                        style: AppStyles.styleTextBody14(colorText: AppColors.white),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Payuung Karyawan',
                                      style: AppStyles.styleTextBody14(colorText: AppColors.blackIcon),
                                    ),
                                  ),
                                ],
                              ),
                            ).marginSymmetric(horizontal: 20),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                'Produk Keuangan',
                                style: AppStyles.styleTextBody20(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                            itemCount: controller.menuItemsKeuangan.length,
                            itemBuilder: (context, index) {
                              return MenuItemWidget(menuItem: controller.menuItemsKeuangan[index]);
                            },
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Kategori Pilihan',
                                style: AppStyles.styleTextBody20(fontWeight: FontWeight.bold),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.grayMedium,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: const Text('Wishlist').marginAll(5),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 220,
                            child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                              itemCount: controller.menuItemsKategori.length,
                              itemBuilder: (context, index) {
                                return MenuItemWidget(menuItem: controller.menuItemsKategori[index]);
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          ProductListSection(products: controller.products),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => CustomBottomSheet(),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                        ),
                        backgroundColor: Colors.white,
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 90,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.home, color: AppColors.primary),
                              SizedBox(height: 5),
                              Text('Beranda', style: TextStyle(color: Colors.orange)),
                            ],
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.search, color: Colors.black),
                              SizedBox(height: 5),
                              Text('Cari', style: TextStyle(color: Colors.black)),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  const Icon(Icons.shopping_cart, color: Colors.black),
                                  Positioned(
                                    right: 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      constraints: const BoxConstraints(
                                        minWidth: 16,
                                        minHeight: 16,
                                      ),
                                      child: const Text(
                                        '0',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Text('Keranjang', style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
