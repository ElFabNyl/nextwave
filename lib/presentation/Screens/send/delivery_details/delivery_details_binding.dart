import 'package:get/get.dart';
import 'package:nextwave/presentation/Screens/send/delivery_details/delivery_details_controller.dart';

class DeliveryDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DeliveryDetailsController());
  }
}
