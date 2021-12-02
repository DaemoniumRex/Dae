import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getglam/controller/perfil_controller.dart';

class PerfilPage extends GetView<perfilController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    /*appBar: AppBar(
      title: Text("Perfil"),
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
          'assets/img/glamtextmirror.png',
          width: 135,
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




    body: Center(child: Text('perfil',
    style: TextStyle(fontSize: 20
    )),)
    );
  }
  
}