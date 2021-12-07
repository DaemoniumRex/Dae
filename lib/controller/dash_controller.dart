import 'package:get/get.dart';
//import 'package:getglam/ui/pages/dashboard/dash_page.dart';
class DashController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int index){
    tabIndex = index;
    update();
}
}