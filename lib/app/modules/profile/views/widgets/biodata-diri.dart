import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test_fast8/app/constant/styles.dart';
import 'package:technical_test_fast8/app/modules/profile/controllers/profile_controller.dart';
import 'package:technical_test_fast8/app/widget/custom_dropdown.dart';

class BiodataWidget extends StatelessWidget {
  const BiodataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            'Nama Lengkap',
            style: AppStyles.styleTextBody14(),
          ),
          TextFormField(
            decoration: AppStyles.inputDecorationFloating(
              "Nama Lengkap",
            ),
            controller: controller.nameController,
          ),
          const SizedBox(height: 16),
          Text(
            'Tanggal Lahir',
            style: AppStyles.styleTextBody14(),
          ),
          GestureDetector(
            onTap: () async {
              controller.selectDate(context);
            },
            child: TextFormField(
              readOnly: true,
              decoration: AppStyles.inputDecorationFloating(
                'Tanggal Lahir',
              ),
              controller: controller.dateofBrithController,
              onTap: () {
                controller.selectDate(context);
              },
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'No. HP',
            style: AppStyles.styleTextBody14(),
          ),
          TextFormField(
            decoration: AppStyles.inputDecorationFloating(
              'No. HP',
            ),
            keyboardType: TextInputType.phone,
            controller: controller.numberController,
          ),
          const SizedBox(height: 16),
          Text(
            'Jenis Kelamin',
            style: AppStyles.styleTextBody14(),
          ),
          CustomDropdown(
            value: controller.gender,
            items: const [
              DropdownMenuItem(value: 'Laki-laki', child: Text('Laki-laki')),
              DropdownMenuItem(value: 'Perempuan', child: Text('Perempuan')),
            ],
            onChanged: (newValue) {
              controller.updateDropdown('gender', newValue);
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Alamat Email',
            style: AppStyles.styleTextBody14(),
          ),
          TextFormField(
            decoration: AppStyles.inputDecorationFloating(
              'Alamat Email',
            ),
            keyboardType: TextInputType.emailAddress,
            controller: controller.emailController,
          ),
          const SizedBox(height: 16),
          Text(
            'Pendidikan',
            style: AppStyles.styleTextBody14(),
          ),
          CustomDropdown(
            value: controller.pendidikan,
            items: const [
              DropdownMenuItem(value: 'SD', child: Text('SD')),
              DropdownMenuItem(value: 'SMP', child: Text('SMP')),
              DropdownMenuItem(value: 'SMA', child: Text('SMA')),
              DropdownMenuItem(value: 'S1', child: Text('S1')),
              DropdownMenuItem(value: 'S2', child: Text('S2')),
              DropdownMenuItem(value: 'S3', child: Text('S3')),
            ],
            onChanged: (value) {
              controller.updateDropdown('pendidikan', value);
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Status',
            style: AppStyles.styleTextBody14(),
          ),
          CustomDropdown(
            value: controller.status,
            items: const [
              DropdownMenuItem(value: 'Belum Menikah', child: Text('Belum Menikah')),
              DropdownMenuItem(value: 'Menikah', child: Text('Menikah')),
            ],
            onChanged: (value) {
              controller.updateDropdown('status', value);
            },
          ),
          const SizedBox(height: 32),
        ],
      );
    });
  }
}
