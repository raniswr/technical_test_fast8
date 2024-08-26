import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test_fast8/app/constant/colors.dart';
import 'package:technical_test_fast8/app/modules/profile/views/widgets/alamat-pribadi.dart';
import 'package:technical_test_fast8/app/modules/profile/views/widgets/biodata-diri.dart';
import 'package:technical_test_fast8/app/modules/profile/views/widgets/informasi-perusahaan.dart';
import 'package:technical_test_fast8/app/widget/custom_button.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informasi Pribadi'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<ProfileController>(
            init: ProfileController(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    StepIndicator(
                      steps: ['Biodata Diri', 'Alamat Pribadi', 'Informasi Perusahaan'],
                      currentStep: controller.currentWidget,
                    ),
                    const SizedBox(height: 20),
                    controller.currentWidget == 0
                        ? BiodataWidget()
                        : controller.currentWidget == 1
                            ? AlamatPribadiWidget(upload: () => _showImageSourceDialog(context))
                            : InformasiPerusahaanWidget(),
                    controller.currentWidget == 0
                        ? SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: CustomButton(
                              label: 'Selanjutnya',
                              onPressed: () {
                                controller.switchWidget();
                              },
                              backgroundColor: AppColors.primary,
                              textColor: Colors.white,
                            ),
                          )
                        : controller.currentWidget == 1
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomButton(
                                    label: 'Sebelumnya',
                                    onPressed: () {
                                      controller.switchWidgetSebelumnya();
                                    },
                                    isOutlined: true,
                                  ),
                                  CustomButton(
                                    label: 'Selanjutnya',
                                    onPressed: () {
                                      controller.switchWidget();
                                    },
                                    backgroundColor: AppColors.primary,
                                    textColor: Colors.white,
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomButton(
                                    label: 'Sebelumnya',
                                    onPressed: () {
                                      controller.switchWidgetSebelumnya();
                                    },
                                    isOutlined: true,
                                  ),
                                  CustomButton(
                                    label: 'Simpan',
                                    onPressed: () {
                                      controller.addProfile();
                                    },
                                    backgroundColor: AppColors.primary,
                                    textColor: Colors.white,
                                  ),
                                ],
                              ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  void _showImageSourceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.only(top: 20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Center(child: Text('Buka kamera', style: TextStyle(fontSize: 18))),
                onTap: () {
                  Get.find<ProfileController>().pickImageFromCamera();
                  Navigator.pop(context);
                },
              ),
              const Divider(height: 1),
              ListTile(
                title: const Center(child: Text('Ambil dari galeri', style: TextStyle(fontSize: 18))),
                onTap: () {
                  Get.find<ProfileController>().pickImageFromGallery();
                  Navigator.pop(context);
                },
              ),
              const Divider(height: 1),
              ListTile(
                title: const Center(
                  child: Text('Batal', style: TextStyle(color: Colors.yellow, fontSize: 18)),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class StepIndicator extends StatelessWidget {
  final List<String> steps;
  final int currentStep;

  const StepIndicator({
    Key? key,
    required this.steps,
    required this.currentStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(steps.length, (index) {
      return Expanded(
        child: Column(
          children: [
            SizedBox(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: index <= currentStep ? Colors.yellow : Colors.grey.shade300,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: index <= currentStep ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (index != steps.length - 1)
                    Expanded(
                      child: Container(
                        height: 4,
                        color: index < currentStep ? Colors.yellow : Colors.grey.shade300,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    steps[index],
                    maxLines: 1,
                    style: TextStyle(
                      color: index <= currentStep ? Colors.black : Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    })).marginOnly(left: 50);
  }
}
