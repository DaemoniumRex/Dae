import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getglam/ui/routes/app_routes.dart';
import 'package:getglam/ui/routes/app_pages.dart';
import 'package:getglam/themes/app_themes.dart';
//main para login
import 'package:getglam/ui/pages/login/loginpage.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 /* @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      title: "GetGlam",
      initialRoute: AppRoutes.DASHBOARD,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      darkTheme: AppThemes.dark,
      theme: AppThemes.light,
      themeMode: ThemeMode.system,
    ) ;
  }
*/

@override
  Widget build(BuildContext context) {
    return GetMaterialApp(

title: 'GetGlam',
debugShowCheckedModeBanner: false,
home: Login(),
getPages: AppPages.list,
      darkTheme: AppThemes.dark,
      theme: AppThemes.light,
      themeMode: ThemeMode.system,
    );

    

  }


}