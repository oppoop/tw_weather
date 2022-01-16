import 'package:get/get.dart';

import '../controllers/forcast_controller.dart';

class ForcastBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForcastController>(
      () => ForcastController(apiProvider: Get.find()),
    );
  }
}
