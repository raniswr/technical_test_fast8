import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test_fast8/app/constant/styles.dart';
import 'package:technical_test_fast8/app/modules/profile/controllers/profile_controller.dart';
import 'package:technical_test_fast8/app/widget/custom_dropdown.dart';

class InformasiPerusahaanWidget extends StatelessWidget {
  const InformasiPerusahaanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nama Perusahaan",
            style: AppStyles.styleTextBody14(),
          ),
          TextFormField(
            decoration: AppStyles.inputDecorationFloating(
              "Nama Perusahaan",
            ),
            controller: controller.namaPerusahaanController,
          ),
          const SizedBox(height: 16),
          Text(
            'Alamat Perusahaan',
            style: AppStyles.styleTextBody14(),
          ),
          TextFormField(
            decoration: AppStyles.inputDecorationFloating(
              'Alamat Perusahaan',
            ),
            controller: controller.alamatPerusahaanController,
          ),
          const SizedBox(height: 16),
          Text(
            'Jabatan',
            style: AppStyles.styleTextBody14(),
          ),
          CustomDropdown(
            value: controller.jabatan,
            items: const [
              DropdownMenuItem(value: 'Non-staf', child: Text('Non-staf')),
              DropdownMenuItem(value: 'Staf', child: Text('Staf')),
              DropdownMenuItem(value: 'Supervisor', child: Text('Supervisor')),
            ],
            onChanged: (value) {
              controller.updateDropdown('jabatan', value);
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Lama Bekerja',
            style: AppStyles.styleTextBody14(),
          ),
          CustomDropdown(
            value: controller.lamaBekerja,
            items: const [
              DropdownMenuItem(value: '< 6 bulan', child: Text('< 6 bulan')),
              DropdownMenuItem(value: '6 bulan - 1 tahun', child: Text('6 bulan - 1 tahun')),
              DropdownMenuItem(value: '1 - 2 tahun', child: Text('1 - 2 tahun')),
            ],
            onChanged: (value) {
              controller.updateDropdown('lamaBekerja', value);
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Sumber Pendapatan',
            style: AppStyles.styleTextBody14(),
          ),
          CustomDropdown(
            value: controller.sumberPendapatan,
            items: const [
              DropdownMenuItem(value: 'Gaji', child: Text('Gaji')),
              DropdownMenuItem(value: 'Bisnis', child: Text('Bisnis')),
            ],
            onChanged: (value) {
              controller.updateDropdown('sumberPendapatan', value);
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Pendapatan Kotor Pertahun',
            style: AppStyles.styleTextBody14(),
          ),
          CustomDropdown(
            value: controller.pendapatanKotor,
            items: const [
              DropdownMenuItem(value: '< 10 juta', child: Text('< 10 juta')),
              DropdownMenuItem(value: '10 - 50 juta', child: Text('10 - 50 juta')),
            ],
            onChanged: (value) {
              controller.updateDropdown('pendapatanKotor', value);
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Nama Bank',
            style: AppStyles.styleTextBody14(),
          ),
          CustomDropdown(
            value: controller.namaBank,
            items: const [
              DropdownMenuItem(value: 'BNI', child: Text('BNI')),
              DropdownMenuItem(value: 'BCA', child: Text('BCA')),
            ],
            onChanged: (value) {
              controller.updateDropdown('namaBank', value);
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Cabang Bank',
            style: AppStyles.styleTextBody14(),
          ),
          TextFormField(
            decoration: AppStyles.inputDecorationFloating(
              'Cabang Bank',
            ),
            controller: controller.cabangBankController,
          ),
          const SizedBox(height: 16),
          Text(
            'Nomor Rekening',
            style: AppStyles.styleTextBody14(),
          ),
          TextFormField(
            decoration: AppStyles.inputDecorationFloating(
              'Nomor Rekening',
            ),
            controller: controller.nomorRekeningController,
          ),
          const SizedBox(height: 16),
          Text(
            'Nama Pemilik Rekening',
            style: AppStyles.styleTextBody14(),
          ),
          TextFormField(
            decoration: AppStyles.inputDecorationFloating(
              'Nama Pemilik Rekening',
            ),
            controller: controller.namaPemilikController,
          ),
          const SizedBox(height: 16),
        ],
      );
    });
  }
}
