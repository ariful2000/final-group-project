import 'package:flutter/material.dart';
import 'package:fooddonationapp/controllers/main_controller.dart';
import 'package:fooddonationapp/res/app_colors.dart';
import 'package:fooddonationapp/res/app_images.dart';
import 'package:fooddonationapp/screens/auth/components/auth_button.dart';
import 'package:fooddonationapp/screens/profile/components/profile_field.dart';
import 'package:fooddonationapp/screens/profile/controllers/profile_controller.dart';
import 'package:fooddonationapp/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final MainController _mainController = Get.put(MainController());
  final ProfileController controller = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    controller.nameController =
        TextEditingController(text: _mainController.currentUser.value!.name);
  }

  @override
  void dispose() {
    controller.nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          title: const Text(
            'Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                CircleAvatar(
                  backgroundColor: AppColors.primaryColor.withOpacity(0.5),
                  radius: 55.0,
                  child: Obx(
                    () => Hero(
                      tag: 'profile',
                      child: CircleAvatar(
                        radius: 54.5,
                        backgroundColor:
                            AppColors.primaryColor.withOpacity(0.5),
                        backgroundImage: _getImage(),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    showImageOptionBox(
                      context: context,
                      cameraPressed: () =>
                          controller.pickImage(ImageSource.camera),
                      galleryPressed: () =>
                          controller.pickImage(ImageSource.gallery),
                    );
                  },
                  child: const Text(
                    'Upload Image',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30),
                ProfileField(
                  controller: controller.nameController,
                  hintText: 'Name',
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 30),
                Obx(
                  () => controller.loading.value
                      ? circularProgress()
                      : AuthButton(
                          buttonText: 'Save',
                          onPressed: () {
                            if (controller.validate()) {
                              controller.updateProfile();
                            }
                          },
                        ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getImage() {
    if (controller.imageFile.value != null) {
      return FileImage(controller.imageFile.value!);
    } else {
      return _mainController.currentUser.value!.profileImageUrl == null
          ? const AssetImage(AppImages.profile)
          : NetworkImage(_mainController.currentUser.value!.profileImageUrl!);
    }
  }
}
