import 'package:flutter/material.dart';
import 'package:getglam/controller/controllerauth.dart';
import 'package:getglam/controller/controllerfirestore.dart';
import 'package:getglam/ui/pages/home/home_page.dart';
import 'package:get/get.dart';
 
class AgregarEstado extends StatefulWidget {
  @override
  _AgregarEstadoState createState() => _AgregarEstadoState();
}
 
class _AgregarEstadoState extends State<AgregarEstado> {
  TextEditingController controltitulo = TextEditingController();
  TextEditingController controldetalle = TextEditingController();
  ControllerFirestore controlestados = Get.find();
  Controllerauth controluser = Get.find();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        title: Text("Nuevo Estado"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              TextField(
                controller: controltitulo,
                decoration: InputDecoration(labelText: "Titulo"),
              ),
              TextField(
                controller: controldetalle,
                decoration: InputDecoration(labelText: "Descripcion"),
              ),
              ElevatedButton(
                
                child: Text("Postealo"),
                onPressed: () {
                  var estados = <String, dynamic>{
                    'titulo': controltitulo.text,
                    'detalle': controldetalle.text,
                    'photo': controluser.photo,
                    'name': controluser.name,
                    'uid': controluser.uid,
                  };
 
                  controlestados.crearestado(estados);
                  Get.toNamed("DASHBOARD");
                  //Get.off(() => HomePage(title: 'Listar'));
                },
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
