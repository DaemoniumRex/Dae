//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getglam/controller/dash_controller.dart';

import 'package:getglam/ui/pages/home/home_page.dart';
import 'package:getglam/ui/pages/profile/perfil_page.dart';
import 'package:getglam/ui/pages/chat/chat_page.dart';
import 'package:getglam/ui/pages/buscar/buscar_page.dart';


class DashPage extends  StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashController>(
      builder: (controller) {
  return Scaffold(
    body: SafeArea(
      child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomePage(),
                PerfilPage(),
                Chat(),
                BuscarPage(),
              ],
            ),
    ),
bottomNavigationBar: BottomNavigationBar(
  
  unselectedItemColor: Colors.amber,
  selectedItemColor: Colors.amber[100],

  onTap: controller.changeTabIndex,

  currentIndex: controller.tabIndex,
  type: BottomNavigationBarType.fixed,
  showSelectedLabels: true,
  showUnselectedLabels: false,
  backgroundColor: Colors.purple.shade900,
  //backgroundColor: Colors.white,
  elevation: 0,

  items: [

_bottomNavigationBarItem(
  
  
  icon: Icons.home_outlined,
  label: 'Home',
  
  

  //backgroundColor: Colors.purple.shade900,
),
_bottomNavigationBarItem(
  icon: Icons.account_box_outlined,
  label: "Perfil",
  //backgroundColor: Colors.deepPurple.shade900,
),
_bottomNavigationBarItem(
icon: Icons.markunread_outlined,
  label: "Chat",
    //backgroundColor: Colors.lightBlue.shade900,


),
_bottomNavigationBarItem(
  icon: Icons.catching_pokemon,
  label: "Galeria",
    //backgroundColor: Colors.pink.shade800,

),

],)

,

  );

  }
    );
}

_bottomNavigationBarItem({required IconData icon, required String label, /*required  Color backgroundColor*/}) {

return BottomNavigationBarItem(
 
  icon: Icon(icon),
  label: label,
  //backgroundColor: backgroundColor,
   
);

} }