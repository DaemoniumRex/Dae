/*import 'package:get/get.dart';
import 'package:getglam/ui/pages/home/home_binding.dart';
import 'package:getglam/ui/pages/home/home_page.dart';
import 'package:getglam/ui/routes/app_routes.dart';
import 'package:getglam/ui/pages/profile/perfil_page.dart';
import 'package:getglam/ui/pages/profile/perfil_binding.dart';



class AppPages{
  static var list =[ 
    GetPage( 
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage( 
      name: AppRoutes.PERFIL,
      page: () => PerfilPage(),
      binding: PerfilBinding(),
    ),



  ];
}*/

import 'package:get/get.dart';
import 'package:getglam/ui/pages/dashboard/dash_page.dart';
import 'package:getglam/ui/pages/dashboard/dash_bindings.dart';
import 'package:getglam/ui/routes/app_routes.dart';


class AppPages {
static var list = [
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashPage(),
      binding: DashBinding(),
    ),
  ];

}

