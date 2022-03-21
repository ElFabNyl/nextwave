import 'package:get/get.dart';
import 'package:nextwave/presentation/Screens/send/tracking/tracking_controller.dart';

class TrackingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrackingController());
  }
}
