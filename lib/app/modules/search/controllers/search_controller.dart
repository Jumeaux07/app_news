import 'package:get/get.dart';

class SearchController extends GetxController with  StateMixin{
  // ignore: todo
  //TODO: Implement SearchController

  final count = 0.obs;
    List<String>categorie  = ['politics','business', 'entertainment','environment','food','health','science','sports','technology'].obs;
  @override
  void onInit() {
    change(null,status: RxStatus.empty());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
