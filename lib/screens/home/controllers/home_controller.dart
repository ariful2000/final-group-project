import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late final TextEditingController meatController;
  late final TextEditingController vegetablesController;
  late final TextEditingController dairyController;
  late final TextEditingController seaFoodController;
  late final TextEditingController nutsController;
  late final TextEditingController fruitsController;
  late final TextEditingController grainsController;

  int meatPrice = 10;
  int vegetablesPrice = 8;
  int dairyPrice = 16;
  int seaFoodPrice = 14;
  int nutsPrice = 8;
  int fruitsPrice = 11;
  int grainsPrice = 9;

  RxDouble sum = RxDouble(0);

  @override
  void onInit() {
    super.onInit();
    meatController = TextEditingController();
    vegetablesController = TextEditingController();
    dairyController = TextEditingController();
    seaFoodController = TextEditingController();
    nutsController = TextEditingController();
    fruitsController = TextEditingController();
    grainsController = TextEditingController();
  }

  @override
  void onClose() {
    meatController.dispose();
    vegetablesController.dispose();
    dairyController.dispose();
    seaFoodController.dispose();
    nutsController.dispose();
    fruitsController.dispose();
    grainsController.dispose();
    super.onClose();
  }

  void calculateSum() {
    int enteredMeal =
        meatController.text.isEmpty ? 0 : int.parse(meatController.text);
    int enteredVegetables = vegetablesController.text.isEmpty
        ? 0
        : int.parse(vegetablesController.text);
    int enteredDairy =
        dairyController.text.isEmpty ? 0 : int.parse(dairyController.text);
    int enteredSeaFood =
        seaFoodController.text.isEmpty ? 0 : int.parse(seaFoodController.text);
    int enteredNuts =
        nutsController.text.isEmpty ? 0 : int.parse(nutsController.text);
    int enteredFruits =
        fruitsController.text.isEmpty ? 0 : int.parse(fruitsController.text);
    int enteredGrains =
        grainsController.text.isEmpty ? 0 : int.parse(grainsController.text);

    int total = (enteredMeal * meatPrice) +
        (enteredVegetables * vegetablesPrice) +
        (enteredSeaFood * seaFoodPrice) +
        (enteredDairy * dairyPrice) +
        (enteredNuts * nutsPrice) +
        (enteredFruits * fruitsPrice) +
        (enteredGrains * grainsPrice);
    sum(double.parse(total.toString()));
  }
}
