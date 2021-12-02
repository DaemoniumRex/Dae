import'package:flutter/material.dart';
//import 'package:getglam/ui/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:getglam/controller/home_controller.dart';


class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*
      appBar: AppBar(
        title: Text(
          controller.title,
          style: TextStyle(
          color: Colors.black),
          
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),*/

appBar: AppBar(
        //backgroundColor: Color(0xFF330054),
        backgroundColor: Colors.purple.shade900,
        leading: Container(
          width: 120,
          height: 120,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'assets/img/icon.png',
          ),
        ),
        title: Image.asset(
          'assets/img/glamtext.png',
          width: 125,
          fit: BoxFit.contain,
        ),


        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 20, 6),
            child: InkWell(
              child: Image.asset(
                'assets/img/pclosedeyeico.png',
                height: 6,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 10,
        //shape: BeveledRectangleBorder(
        //borderRadius: BorderRadius.circular(20)
        //),
      ),



      body: Container(
  
        child: Center(
          child: Text(
            "Home Page",
            style: TextStyle(fontSize: 20),
          )
          ,)
        
        
        /*RaisedButton(
          child: Text ('Perfil'),
          onPressed: () => Get.toNamed(AppRoutes.PERFIL, arguments: {'name' : 'John Doe'}),
        )*/
        



        ),
    );
  }
  
}