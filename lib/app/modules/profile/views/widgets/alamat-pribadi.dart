import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test_fast8/app/constant/styles.dart';
import 'package:technical_test_fast8/app/modules/profile/controllers/profile_controller.dart';
import 'package:technical_test_fast8/app/widget/custom_dropdown.dart';

class AlamatPribadiWidget extends StatelessWidget {
  final VoidCallback upload;

  const AlamatPribadiWidget({super.key, required this.upload});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: upload,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.credit_card, color: Colors.yellow, size: 40),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Upload KTP', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text(controller.selectedImagePath != null ? controller.selectedImagePath ?? '' : '', style: const TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                      controller.selectedImagePath != null ? const Icon(Icons.check_circle, color: Colors.green, size: 30) : const SizedBox.shrink(),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: AppStyles.inputDecorationFloating(
                      "NIK",
                    ),
                    controller: controller.nikController,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Alamat sesuai KTP',
            style: AppStyles.styleTextBody14(),
          ),
          TextFormField(
            decoration: AppStyles.inputDecorationFloating(
              'Alamat sesuai KTP',
            ),
            controller: controller.alamatController,
          ),
          const SizedBox(height: 16),
          Text(
            'Provinsi',
            style: AppStyles.styleTextBody14(),
          ),
          CustomDropdown(
            value: controller.provinsi,
            items: const [
              DropdownMenuItem(value: 'Bali', child: Text('Bali')),
            ],
            onChanged: (value) {
              // Handle selected province
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Kabupaten/Kota',
            style: AppStyles.styleTextBody14(),
          ),
          CustomDropdown(
            value: controller.kota,
            items: const [
              DropdownMenuItem(value: 'Badung', child: Text('Badung')),
              DropdownMenuItem(value: 'Bangli', child: Text('Bangli')),
              DropdownMenuItem(value: 'Buleleng', child: Text('Buleleng')),
              DropdownMenuItem(value: 'Gianyar', child: Text('Gianyar')),
              DropdownMenuItem(value: 'Jembrana', child: Text('Jembrana')),
              DropdownMenuItem(value: 'Karangasem', child: Text('Karangasem')),
              DropdownMenuItem(value: 'Klungkung', child: Text('Klungkung')),
              DropdownMenuItem(value: 'Tabanan', child: Text('Tabanan')),
              DropdownMenuItem(value: 'Denpasar', child: Text('Denpasar')),
            ],
            onChanged: (value) {
              controller.updateDropdown(controller.kota, value);
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Kelurahan',
            style: AppStyles.styleTextBody14(),
          ),
          CustomDropdown(
            value: 'Badung',
            items: const [
              DropdownMenuItem(value: 'Badung', child: Text('Badung')),
            ],
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          Text(
            'Kecamatan',
            style: AppStyles.styleTextBody14(),
          ),
          CustomDropdown(
            value: 'Kuta',
            items: const [
              DropdownMenuItem(value: 'Kuta', child: Text('Kuta')),
            ],
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          Text(
            'Kode pos',
            style: AppStyles.styleTextBody14(),
          ),
          TextFormField(
            decoration: AppStyles.inputDecorationFloating(
              'Kode Pos',
            ),
            keyboardType: TextInputType.number,
            controller: controller.kodePosController,
          ),
          const SizedBox(height: 32),
        ],
      );
    });
  }
}
