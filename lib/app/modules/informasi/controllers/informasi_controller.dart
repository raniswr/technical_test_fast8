import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class InformasiController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future<void> pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
      update(); // Trigger UI update
    }
  }

  Future<void> pickImageFromCamera() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
      update(); // Trigger UI update
    }
  }
}
