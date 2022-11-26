import 'dart:async';

import 'package:app_news/app/routes/app_pages.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:get_storage/get_storage.dart';

class NetworkController extends GetxController with StateMixin{
  // ignore: todo
  //TODO: Implement NetworkController
  final connectionStatus = 0.obs;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySoubscription;
  final storage = GetStorage();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print("NetXork");
    getFirstData();
    _connectivitySoubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  getFirstData() async{
    if(storage.read("first_data")!=null){
      print("appli deja open");
      return initConnection();
    }
    if(storage.read("first_data")==0){
      storage.write("first_data", 1);
      return initConnection();
    }
    if(storage.read("first_data")==null){
      storage.write("first_data",0);
            print("appli not open");
      return initConnection();
    }
  }


    Future<void> initConnection() async{
      ConnectivityResult result;
      try{
        result = await _connectivity.checkConnectivity();
      } on PlatformException catch(e){
        print(e.toString());
      }
      return _updateConnectionStatus(result);
    }
    Future<void> _updateConnectionStatus(ConnectivityResult result)async {
     print("boss");
      switch (result) {
        case ConnectivityResult.wifi :
          this.connectionStatus.value = 1;
          print(this.connectionStatus.value);
          storage.write("stateConnect", 1);
          Get.toNamed(AppPages.INITIAL);
          break;
        case ConnectivityResult.mobile :
          this.connectionStatus.value = 2;
          storage.write("stateConnect", 2);
          Get.toNamed(AppPages.INITIAL); 
          print(this.connectionStatus.value);
          print("ok");
          break;
        case ConnectivityResult.none :
          this.connectionStatus.value = 0;
          print(this.connectionStatus.value);
          print("not ok");
          storage.write("stateConnect", 0);
          Get.toNamed(AppPages.INITIAL);
          break;
        default:
          Get.snackbar("Erreur Internet", "Erreur de connection");
          break;
      }
    }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
