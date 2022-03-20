import 'package:get/get.dart';

import 'address_infos.dart';

class AddressInfosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressInfosController());
  }
}
