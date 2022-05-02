import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fooddonationapp/controllers/main_controller.dart';
import 'package:fooddonationapp/enums/snackbar_message.dart';
import 'package:fooddonationapp/helpers/local_storage.dart';
import 'package:fooddonationapp/helpers/my_file_picker.dart';
import 'package:fooddonationapp/models/user_model.dart';
import 'package:fooddonationapp/services/storage_service.dart';
import 'package:fooddonationapp/services/user_service.dart';
import 'package:fooddonationapp/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  late final TextEditingController nameController;
  RxBool loading = false.obs;
  Rx<File?> imageFile = Rx<File?>(null);

  final MainController _mainController = Get.put(MainController());

  void updateProfile() async {
    try {
      loading(true);
      UserModel userModel = _mainController.currentUser.value!;
      userModel.name = nameController.text.trim();
      if (imageFile.value != null) {
        String downloadUrl = await StorageService.uploadProfileImage(
            imageFile.value!, userModel.uid);
        userModel.profileImageUrl = downloadUrl;
      }
      await UserService.saveUser(userModel);
      await LocalStorage.saveUser(userModel);
      _mainController.getCurrentUser();
      loading(false);
      Get.back();
      showSnackbar(SnackbarMessage.success, 'Profile Update SuccessFully');
    } catch (e) {
      loading(false);
      showSnackbar(SnackbarMessage.error, e.toString());
    }
  }

  void pickImage(ImageSource imageSource) async {
    File? pickedFile = await MyFilePicker.pickImage(imageSource);
    Get.back();
    if (pickedFile != null) {
      imageFile(pickedFile);
    }
  }

  bool validate() {
    if (nameController.text.trim().isEmpty) {
      showSnackbar(SnackbarMessage.missing, 'Please enter your name.');
      return false;
    } else {
      return true;
    }
  }
}
