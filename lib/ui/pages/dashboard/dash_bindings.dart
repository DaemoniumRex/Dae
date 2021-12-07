import 'package:get/get.dart';
import 'package:getglam/controller/home_controller.dart';
import 'package:getglam/controller/dash_controller.dart';
import 'package:getglam/controller/perfil_controller.dart';
import 'package:getglam/controller/chat_controller.dart';
import 'package:getglam/controller/buscar_controller.dart';



class DashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashController>(() => DashController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<perfilController>(() => perfilController());
    Get.lazyPut<ChatController>(() => ChatController());
    Get.lazyPut<BuscarController>(() => BuscarController());

  }
}
