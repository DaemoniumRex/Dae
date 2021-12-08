import 'package:flutter/material.dart';
import 'package:getglam/controller/controllerfirestore.dart';
// import 'package:getglam/ui/pages/home/listarestados.dart';
import 'package:get/get.dart';
import 'package:getglam/ui/pages/home/home_page.dart';

 
class ModificarEstado extends StatefulWidget {
  final iddoc;
  final pos;
  final List estado;
  ModificarEstado({required this.estado, this.pos, this.iddoc});
 
  @override
  _ModificarEstadoState createState() => _ModificarEstadoState();
}
 
class _ModificarEstadoState extends State<ModificarEstado> {
  TextEditingController controltitulo = TextEditingController();
  TextEditingController controldetalle = TextEditingController();
  ControllerFirestore controlestados = Get.find();
 
  @override
  void initState() {
    controltitulo =
        TextEditingController(text: widget.estado[widget.pos]['titulo']);
    controldetalle =
        TextEditingController(text: widget.estado[widget.pos]['detalle']);
 
    // TODO: implement initState
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        title: Text("Retoque", ),
        actions: [
          IconButton(
              tooltip: 'Eliminar Post',
              icon: Icon(Icons.delete),
              onPressed: () {
                Navigator.pop(context);
                controlestados.eliminarestados(widget.estado[widget.pos].id,);
                  Get.toNamed("DASHBOARD");
                  //Get.off(() => ListaMensajeros2(title: 'Lista'));
              })
        ],
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
                decoration: InputDecoration(labelText: "Detalle"),
              ),
              ElevatedButton(
                child: Text("Retoque Estado"),
                onPressed: () {
                  var estado = <String, dynamic>{
                    'titulo': controltitulo.text,
                    'detalle': controldetalle.text,
                  };
 
                  controlestados.actualizarestado(
                      widget.estado[widget.pos].id, estado);
                  Get.toNamed("DASHBOARD");
                  //Get.off(() => ListaMensajeros2(title: 'Lista'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
