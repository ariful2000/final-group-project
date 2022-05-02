import 'package:fooddonationapp/controllers/main_controller.dart';
import 'package:fooddonationapp/res/app_colors.dart';
import 'package:fooddonationapp/res/app_images.dart';
import 'package:fooddonationapp/screens/home/components/home_field.dart';
import 'package:fooddonationapp/screens/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:fooddonationapp/screens/profile/profile_screen.dart';
import 'package:fooddonationapp/screens/requests/food_requests_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MainController _mainController = Get.put(MainController());
  final HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    _mainController.refreshCurrentUser();
  }

  _getImage() {
    return _mainController.currentUser.value!.profileImageUrl == null
        ? const AssetImage(AppImages.profile)
        : NetworkImage(_mainController.currentUser.value!.profileImageUrl!);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                _buildInstructions(),
                const SizedBox(height: 20),
                const Text(
                  'Tax Deduction Calculator',
                  style: TextStyle(
                    fontSize: 26.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                _buildFields(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFields() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeField(
              label: 'Meat',
              hintText: '\$${controller.meatPrice} per pound',
              controller: controller.meatController,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                controller.calculateSum();
              },
            ),
            const SizedBox(width: 20.0),
            HomeField(
              label: 'Vegetables',
              hintText: '\$${controller.vegetablesPrice} per pound',
              controller: controller.vegetablesController,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                controller.calculateSum();
              },
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeField(
              label: 'Dairy',
              hintText: '\$${controller.dairyPrice} per pound',
              controller: controller.dairyController,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                controller.calculateSum();
              },
            ),
            const SizedBox(width: 20.0),
            HomeField(
              label: 'Sea Food',
              hintText: '\$${controller.seaFoodPrice} per pound',
              controller: controller.seaFoodController,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                controller.calculateSum();
              },
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeField(
              label: 'Nuts',
              hintText: '\$${controller.nutsPrice} per pound',
              controller: controller.nutsController,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                controller.calculateSum();
              },
            ),
            const SizedBox(width: 20.0),
            HomeField(
              label: 'Fruits',
              hintText: '\$${controller.fruitsPrice} per pound',
              controller: controller.fruitsController,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                controller.calculateSum();
              },
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeField(
              label: 'Grains',
              hintText: '\$${controller.grainsPrice} per pound',
              controller: controller.grainsController,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                controller.calculateSum();
              },
            ),
            const SizedBox(width: 20.0),
            _buildSum(),
          ],
        ),
      ],
    );
  }

  Widget _buildSum() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sum',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: MediaQuery.of(context).size.width * 0.43,
          height: 40,
          padding: const EdgeInsets.only(top: 3.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.43 - 20,
              child: Obx(
                () => Text(
                  controller.sum.value.toStringAsFixed(2),
                  style: const TextStyle(color: Colors.black, fontSize: 20.0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInstructions() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '•',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Text(
                  ' Check your deductions below with our special calculator.',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '•',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Text(
                  ' Just enter the # of pounds of food you have in each category, '
                  'and get a deduction estimate.',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.primaryColor,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: GestureDetector(
          onTap: () => Get.to(const ProfileScreen()),
          child: Obx(
            () => CircleAvatar(
              backgroundColor: Colors.grey[400],
              backgroundImage: _getImage(),
            ),
          ),
        ),
      ),
      centerTitle: true,
      title: GestureDetector(
        onTap: () => Get.to(const ProfileScreen()),
        child: Obx(
          () => Text(
            _mainController.currentUser.value!.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      actions: [
        PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'Profile') {
              Get.to(const ProfileScreen());
            }
            if (value == 'Food Requests') {
              Get.to(const FoodRequestScreen());
            }
            if (value == 'Logout') {
              _mainController.logout();
            }
          },
          itemBuilder: (BuildContext contesxt) {
            return const [
              PopupMenuItem(
                child: Text('Profile'),
                value: 'Profile',
              ),
              PopupMenuItem(
                child: Text('Food Requests'),
                value: 'Food Requests',
              ),
              PopupMenuItem(
                child: Text('Logout'),
                value: 'Logout',
              ),
            ];
          },
        ),
      ],
    );
  }
}
