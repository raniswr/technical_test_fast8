import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test_fast8/app/constant/colors.dart';
import 'package:technical_test_fast8/app/model/explore-wellness/explore_wellness.dart';
import 'package:technical_test_fast8/app/model/menu/menu_model.dart';
import 'package:technical_test_fast8/app/model/product/product_model.dart';
import 'package:technical_test_fast8/app/utils/database_helper.dart';

class HomeController extends GetxController {
  List<MenuItem> menuItemsKeuangan = [
    MenuItem(title: 'Pembiayaan Kuota Haji', icon: Icons.person, color: AppColors.green),
    MenuItem(title: 'Financial Check Up', icon: Icons.monetization_on, color: AppColors.yellow),
    MenuItem(title: 'Asuransi Mobil', icon: Icons.directions_car, color: AppColors.grey),
    MenuItem(title: 'Properti', icon: Icons.home, color: AppColors.red),
  ];
  List<MenuItem> menuItemsKategori = [
    MenuItem(title: 'Hobbies', icon: Icons.beach_access, color: AppColors.blue),
    MenuItem(title: 'Office Fashion', icon: Icons.work, color: AppColors.blue),
    MenuItem(title: 'Healthy Life', icon: Icons.favorite, color: AppColors.red),
    MenuItem(title: 'Counseling & Spiritual', icon: Icons.local_library, color: AppColors.blue),
    MenuItem(title: 'Child Care', icon: Icons.child_care, color: AppColors.purple),
    MenuItem(title: 'Self Development', icon: Icons.psychology, color: AppColors.green),
    MenuItem(title: 'Personal Finance', icon: Icons.account_balance_wallet, color: AppColors.green),
    MenuItem(title: 'More', icon: Icons.more_horiz, color: AppColors.blackIcon),
  ];

  List<ProductItem> products = [];

  @override
  void onReady() async {
    var dbHelper = DatabaseHelper();

    List<ExploreWellness> wellnessList = await dbHelper.getExploreWellness();
    products = wellnessList.map((wellness) {
      return ProductItem(
        assetPath: wellness.imageAssetPath,
        title: wellness.name,
        price: wellness.price,
      );
    }).toList();
    update();

    if (wellnessList.isNotEmpty) {
      products = wellnessList.map((wellness) {
        return ProductItem(
          assetPath: wellness.imageAssetPath,
          title: wellness.name,
          price: wellness.price,
        );
      }).toList();
      update();
    } else if (wellnessList.isEmpty) {
      var newWellness = ExploreWellness(
        name: 'Voucher Digital Alfamart',
        price: 'Rp.25.000',
        imageAssetPath: 'assets/images/alfamart_voucher.png',
      );
      await dbHelper.insertExploreWellness(newWellness);
      var newWellness2 = ExploreWellness(
        name: 'Voucher Digital Grab',
        price: 'Rp 121.400',
        imageAssetPath: 'assets/images/Grab_Logo.png',
      );

      await dbHelper.insertExploreWellness(newWellness2);
      var newWellness3 = ExploreWellness(
        name: 'Voucher Digital Kimia Farma',
        price: 'Rp 141.400',
        imageAssetPath: 'assets/images/kimia_farma_logo.png',
      );

      await dbHelper.insertExploreWellness(newWellness3);
      var newWellness4 = ExploreWellness(
        name: 'Voucher Digital Gojek',
        price: 'Rp 221.400',
        imageAssetPath: 'assets/images/gojek_logo.png',
      );

      await dbHelper.insertExploreWellness(newWellness4);
      var newWellness5 = ExploreWellness(
        name: 'Voucher Digital Indomaret',
        price: 'Rp 181.400',
        imageAssetPath: 'assets/images/indomaret.png',
      );

      await dbHelper.insertExploreWellness(newWellness5);

      var newWellness6 = ExploreWellness(
        name: 'Voucher Digital Youvit',
        price: 'Rp 161.400',
        imageAssetPath: 'assets/images/youfit_logo.png',
      );

      await dbHelper.insertExploreWellness(newWellness6);
      List<ExploreWellness> wellnessList = await dbHelper.getExploreWellness();
      products = wellnessList.map((wellness) {
        return ProductItem(
          assetPath: wellness.imageAssetPath,
          title: wellness.name,
          price: wellness.price,
        );
      }).toList();
      update();
    }
    super.onReady();
  }
}
