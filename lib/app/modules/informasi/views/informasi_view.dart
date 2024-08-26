import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test_fast8/app/constant/colors.dart';
import 'package:technical_test_fast8/app/routes/app_pages.dart';
import '../controllers/informasi_controller.dart';

class InformasiView extends GetView<InformasiController> {
  const InformasiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: AppColors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<InformasiController>(
                builder: (controller) {
                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showImageSourceDialog(context);
                        },
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.grey.shade400,
                          backgroundImage: controller.selectedImage != null ? FileImage(controller.selectedImage!) : null,
                          child: controller.selectedImage == null
                              ? const Text(
                                  'R',
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.white,
                                  ),
                                )
                              : null,
                        ),
                      ),
                      const Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.camera_alt,
                            size: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Rani Prabaswari',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Masuk dengan Google',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.PROFILE);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the container
                borderRadius: BorderRadius.circular(10), // Rounded corners
                border: Border.all(
                  color: Colors.grey.shade300, // Border color
                  width: 1.0, // Border width
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1), // Shadow color
                    spreadRadius: 2, // Shadow spread
                    blurRadius: 5, // Shadow blur
                    offset: Offset(0, 0.1), // Shadow offset
                  ),
                ],
              ),
              child: ListTile(
                leading: const Icon(Icons.person_outline, color: Colors.grey),
                title: const Text('Informasi Pribadi'),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
                onTap: () {
                  Get.toNamed(Routes.PROFILE);
                },
              ),
            ).marginSymmetric(horizontal: 20),
          ),
        ],
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
          contentPadding: const EdgeInsets.only(top: 20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Center(child: Text('Buka kamera', style: TextStyle(fontSize: 18))),
                onTap: () {
                  controller.pickImageFromCamera();
                  Navigator.pop(context);
                },
              ),
              const Divider(height: 1),
              ListTile(
                title: const Center(child: Text('Ambil dari galeri', style: TextStyle(fontSize: 18))),
                onTap: () {
                  controller.pickImageFromGallery();
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
