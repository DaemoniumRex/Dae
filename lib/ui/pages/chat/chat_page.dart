import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getglam/controller/chat_controller.dart';
import 'package:getglam/controller/controllerauth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:getglam/domain/model/mensajes.dart';
import 'package:get/get.dart';
import 'package:getglam/ui/pages/chat/wmensajes.dart';

import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:getglam/controller/chat_controller.dart';
import 'package:getglam/domain/model/mensajes.dart';






class Chat extends StatefulWidget {
  Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  ScrollController _scrollController = ScrollController();
  TextEditingController _mensajeController = TextEditingController();
  ChatController controlchat = Get.find();
  Controllerauth controluser = Get.find();


  @override
  Widget build(BuildContext context) {
        WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollHaciaAbajo());

    return Scaffold(
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
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(children: [
              _getListaMensajes(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Flexible(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: TextField(
                            keyboardType: TextInputType.text,
                            controller: _mensajeController,
                            onChanged: (text) => setState(() {}),
                            onSubmitted: (input) {
                              _enviarMensaje();
                            },
                            decoration: const InputDecoration(
                                hintText: 'Escribe un mensaje')))),
                IconButton(
                    icon: Icon(_puedoEnviarMensaje()
                        ? CupertinoIcons.arrow_right_circle_fill
                        : CupertinoIcons.arrow_right_circle),
                    onPressed: () {
                      _enviarMensaje();
                    })
              ]),
            ])));
  }





   
  void _enviarMensaje() {
    if (_puedoEnviarMensaje()) {
      final mensaje = Mensaje(_mensajeController.text, DateTime.now(), controluser.userf, controluser.name, controluser.photo, controluser.uid);
      controlchat.guardarMensaje(mensaje);
      _mensajeController.clear();
      setState(() {});
    }
  }
 
  bool _puedoEnviarMensaje() => _mensajeController.text.length > 0;
 
  Widget _getListaMensajes() {
    return Expanded(
        child: FirebaseAnimatedList(
      controller: _scrollController,
      query: controlchat.getMensajes(),
      itemBuilder: (context, snapshot, animation, index) {
        final json = snapshot.value as Map<dynamic, dynamic>;
        print('Id_unico:${snapshot.key}');
        String? key = snapshot.key;
        final mensaje = Mensaje.fromJson(json);
        return MensajeWidget(mensaje.texto, mensaje.fecha,  key!, mensaje.email, mensaje.name, mensaje.photo, mensaje.uid);
      },
    ));
  }
 
  void _scrollHaciaAbajo() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }
}
 
