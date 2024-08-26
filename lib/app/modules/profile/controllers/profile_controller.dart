import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test_fast8/app/constant/colors.dart';
import 'package:technical_test_fast8/app/model/profile/model_profile.dart';
import 'package:technical_test_fast8/app/utils/database_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfileController extends GetxController {
  DatabaseHelper dbHelper = DatabaseHelper();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateofBrithController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController alamatController = TextEditingController();

  TextEditingController kodePosController = TextEditingController();
  TextEditingController namaPerusahaanController = TextEditingController();
  TextEditingController alamatPerusahaanController = TextEditingController();
  TextEditingController cabangBankController = TextEditingController();
  TextEditingController namaPemilikController = TextEditingController();
  TextEditingController nomorRekeningController = TextEditingController();

  String? gender;
  String? pendidikan;
  String? status;
  int currentWidget = 0;
  String provinsi = "Bali";
  String kota = 'Badung';
  String kecamatan = 'Badung';
  String kelurahan = 'Kuta';
  String? jabatan;
  String? lamaBekerja;
  String? sumberPendapatan;
  String? pendapatanKotor;
  String? namaBank;

  void switchWidget() {
    currentWidget = (currentWidget + 1) % 3;
    update();
  }

  void switchWidgetSebelumnya() {
    currentWidget = (currentWidget - 1) < 0 ? 2 : currentWidget - 1;
    update();
  }

  void updateDropdown(String fieldName, String? newValue) {
    switch (fieldName) {
      case 'gender':
        gender = newValue ?? 'Laki-laki';
        break;
      case 'pendidikan':
        pendidikan = newValue ?? 'SD';
        break;
      case 'status':
        status = newValue ?? 'Belum Menikah';
        break;
      case 'provinsi':
        provinsi = newValue ?? 'Bali';
        break;
      case 'kota':
        kota = newValue ?? 'Badung';
        break;
      case 'kecamatan':
        kecamatan = newValue ?? 'Badung';
        break;
      case 'kelurahan':
        kelurahan = newValue ?? 'Kuta';
        break;
      case 'jabatan':
        jabatan = newValue ?? 'Non-staf';
        break;
      case 'lamaBekerja':
        lamaBekerja = newValue ?? '< 6 bulan';
        break;
      case 'sumberPendapatan':
        sumberPendapatan = newValue ?? 'Gaji';
        break;
      case 'pendapatanKotor':
        pendapatanKotor = newValue ?? '< 10 juta';
        break;
      case 'namaBank':
        namaBank = newValue ?? 'BNI';
        break;
    }
    update(); // This will update the UI
  }

  final ImagePicker _picker = ImagePicker();
  String? selectedImagePath;

  Future<void> pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImagePath = pickedFile.path;
      update();
    }
  }

  Future<void> pickImageFromCamera() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      selectedImagePath = pickedFile.path;
      update();
    }
  }

  void addProfile() async {
    await dbHelper.insertProfile(Profile(
      nama: nameController.text,
      alamatUsaha: alamatPerusahaanController.text,
      jabatan: jabatan ?? '',
      lamaBekerja: lamaBekerja ?? '',
      sumberPendapatan: sumberPendapatan ?? '',
      pendapatanKotorPerTahun: pendapatanKotor ?? '',
      namaBank: namaBank ?? '',
      nik: nikController.text,
      status: status ?? '',
      alamatKTP: alamatController.text,
      provinsi: provinsi ?? '',
      kotaKabupaten: kota ?? '',
      kecamatan: kecamatan ?? '',
      kelurahan: kelurahan ?? '',
      kodePos: kodePosController.text,
      tanggalLahir: dateofBrithController.text,
      gender: gender ?? '',
      email: emailController.text,
      number: numberController.text,
      pathImage: selectedImagePath ?? '',
      pendidikan: pendidikan ?? '',
      namaPemilikRekening: namaPemilikController.text,
      namaUsaha: namaPerusahaanController.text,
      cabangBank: cabangBankController.text,
      nomorRekening: nomorRekeningController.text,
    ));

    log('halo $gender');

    Get.snackbar(
      'Success',
      'Profile added successfully!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime lastDate = DateTime(now.year + 3, now.month, now.day, 23, 59, 59);

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1900),
      lastDate: lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.yellow,
            colorScheme: const ColorScheme.light(primary: AppColors.yellow),
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      dateofBrithController.text = formattedDate;
    }
  }

  @override
  void onInit() async {
    List<Profile> profiles = await dbHelper.getProfiles();
    if (profiles.isNotEmpty) {
      profiles.forEach((profile) {
        nameController.text = profile.nama;
        dateofBrithController.text = profile.tanggalLahir;
        numberController.text = profile.number;
        gender = profile.gender;
        emailController.text = profile.email;
        pendidikan = profile.pendidikan;
        status = profile.status;
        nikController.text = profile.nik;
        alamatController.text = profile.alamatKTP;
        provinsi = profile.provinsi;
        kota = profile.kotaKabupaten;
        kecamatan = profile.kecamatan;
        kelurahan = profile.kelurahan;
        kodePosController.text = profile.kodePos;
        namaPerusahaanController.text = profile.namaUsaha;
        alamatPerusahaanController.text = profile.alamatUsaha;
        jabatan = profile.jabatan;
        lamaBekerja = profile.lamaBekerja;
        sumberPendapatan = profile.sumberPendapatan;
        pendapatanKotor = profile.pendapatanKotorPerTahun;
        namaBank = profile.namaBank;
        nomorRekeningController.text = profile.nomorRekening;
        cabangBankController.text = profile.cabangBank;
        namaPemilikController.text = profile.namaPemilikRekening;
      });
    }

    super.onInit();
  }
}
