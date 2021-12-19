import 'package:getglam/controller/controllerauth.dart';
import 'package:flutter/material.dart';
import 'package:getglam/controller/chat_controller.dart';

 
import 'package:get/get.dart';
import 'package:intl/intl.dart';
 
class MensajeWidget extends StatelessWidget {
  final String texto;
  final DateTime fecha;
  final String idmensaje;
  final String email;
  final String name;
    final String uid;


final String photo; 

  MensajeWidget(this.texto, this.fecha, this.idmensaje, this.name, this.email, this. photo, this.uid);
 
  @override
  Widget build(BuildContext context) {
    ChatController controlchat = Get.find();
    Controllerauth controluser = Get.find();
    return Padding(
      padding: const EdgeInsets.only(left: 1, top: 5, right: 1, bottom: 2),
      child: Column(children: [
        ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(photo),
            backgroundColor: Colors.white,
          ),
          title: Text(name),
          subtitle: Text(email),
          
        ),
        Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey[350]!,
                  blurRadius: 2.0,
                  offset: Offset(0, 1.0))
            ], borderRadius: BorderRadius.circular(50.0), color: Colors.white),
            child: MaterialButton(
                disabledTextColor: Colors.black87,
                padding: EdgeInsets.only(left: 18),
                onPressed: null,
                onLongPress: () {
                  if (controluser.uid == uid){
                  controlchat.deleteMensaje(idmensaje);
                  }
                },
                child: Wrap(
                  children: <Widget>[
                    Container(
                        child: Row(
                      children: [
                        Text(texto, style:TextStyle(color: Colors.black45) ),
                      ],
                    ))
                  ],
                ))),
        Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Align(
                alignment: Alignment.topRight,
                child: Text(
                    DateFormat('kk:mma, dd-MM-yyyyy').format(fecha).toString(),
                    style: TextStyle(color: Colors.grey))))
      ]),
    );
  }
}
 
