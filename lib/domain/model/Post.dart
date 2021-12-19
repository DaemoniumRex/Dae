import 'package:flutter/material.dart';
import 'package:getglam/controller/controllerauth.dart';
import 'package:getglam/controller/controlrealtime.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  TextEditingController docid = TextEditingController();
  TextEditingController nombre = TextEditingController();
  //TextEditingController apellido = TextEditingController();
  //TextEditingController direccion = TextEditingController();
  //TextEditingController telefono = TextEditingController();
    TextEditingController animo = TextEditingController();
  TextEditingController lugar = TextEditingController();

  Controllerauth controluser = Get.find();
  ControllerRealtime controlrt = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
    child: Column(
          children: [
            TextField(
              controller: docid,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Ingrese el Documento'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: nombre,
              decoration: InputDecoration(hintText: 'Ingrese el Nombre'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: animo,
              decoration: InputDecoration(hintText: 'Ingrese el Apellido'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: lugar,
              decoration: InputDecoration(hintText: 'Ingrese la Direccion'),
            ),
            SizedBox(
              height: 10,
            ),
            // TextField(
            //   controller: telefono,
            //   decoration: InputDecoration(hintText: 'Ingrese el Telefono'),
            // ),
          

],


        ),



      );
  }}