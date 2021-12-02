import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:getglam/controller/chat_controller.dart';

class ChatPage extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
   
   return Scaffold(

     
    /* appBar: AppBar(
        title: Text(
          'Charla de Salon',
          style: TextStyle(
          color: Colors.black),
          
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),*/

      appBar: AppBar(
        //backgroundColor: Color(0xFF330054),
        //backgroundColor: Colors.purple.shade900,
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
          'assets/img/glamtextchat.png',
          width: 145,
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
        "Chat",
        style: TextStyle(fontSize: 20),
        

        )
      )
       ),
   );
  }
}