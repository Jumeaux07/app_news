import 'package:app_news/app/modules/home/providers/articles_provider.dart';
import 'package:app_news/app/modules/network/controllers/network_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController with StateMixin{
  // ignore: todo
  //TODO: Implement HomeController
  final NetworkController _networkController = Get.find<NetworkController>();
  final storage = GetStorage();
  List<dynamic> responseList= [].obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

 Future<void> getData()async {
    ArticlesProvider().getArticles("fr").then((response) {
      if(response != null){
        this.responseList = this.responseList+ response;
        storage.write("articles", this.responseList);
        change(this.responseList,status: RxStatus.success());
        print(responseList);
      }else{
        storage.write("stateConnect", 0);
        print(storage.read("articles"));
        change(storage.read("articles"), status: RxStatus.success());
      }
      }, onError: (err){
        print(storage.read("articles"));
        change(storage.read("articles"), status: RxStatus.success());
      }
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
