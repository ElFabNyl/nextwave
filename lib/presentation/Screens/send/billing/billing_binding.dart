import 'package:get/get.dart';
import 'package:nextwave/presentation/Screens/send/billing/billing.dart';

class BillingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BillingController());
  }
}
