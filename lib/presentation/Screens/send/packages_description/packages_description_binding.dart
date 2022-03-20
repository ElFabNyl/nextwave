import 'package:get/get.dart';

import 'packages_description_ctrl.dart';

class PackagesDescriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PackagesDecriptionController());
  }
}
