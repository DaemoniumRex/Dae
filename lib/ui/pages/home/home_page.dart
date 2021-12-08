import'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:getglam/ui/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:getglam/controller/controlrealtime.dart';
import 'package:getglam/controller/home_controller.dart';
import 'package:getglam/controller/controllerauth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getglam/controller/controllerfirestore.dart';

import 'package:getglam/ui/pages/home/adicionarestados.dart';
import 'package:getglam/ui/pages/home/editarestados.dart';
//import 'package:getglam/domain/model/Post.dart';




class HomePage extends StatefulWidget {
  HomePage({required this.title});
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ControllerFirestore controlp = Get.find();
  Controllerauth controluser = Get.find();

// TextEditingController docid = TextEditingController();
//   TextEditingController nombre = TextEditingController();
//   TextEditingController animo = TextEditingController();
//   TextEditingController lugar = TextEditingController();
//  // TextEditingController telefono = TextEditingController();

@override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    // return Container();
//   }
// }


// class HomePage extends GetView<HomeController> {
//   @override
//   Widget build(BuildContext context) {

    // HomeController homeController= Get.find();
    // Controllerauth controluser = Get.find();
    // ControllerRealtime controlrt = Get.find();




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
        title: 
            
        
       
            Image.asset(
                      'assets/img/glamtext.png',
                      width: 125,
                      fit: BoxFit.contain,
                        ),

        //Text(controluser.userf),
        

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

      /*body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: [
              TextField(
                controller: docid,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Ingrese su Glam ID'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: nombre,
                decoration: InputDecoration(hintText: 'Ingrese su alias'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: animo,
                decoration: InputDecoration(hintText: 'Ingrese su estado de animo'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: lugar,
                decoration: InputDecoration(hintText: 'Donde estas?'),
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
),


      //  Container(
  
      //   child: Center(
      //     child: Text(
      //       "Home Page",
      //       style: TextStyle(fontSize: 20),
      //     )
      //     ,),

          
        
        
        /*RaisedButton(
          child: Text ('Perfil'),
          onPressed: () => Get.toNamed(AppRoutes.PERFIL, arguments: {'name' : 'John Doe'}),
        )*/
        



        


      //   floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     controlrt.createData(docid.text, nombre.text, animo.text, lugar.text,controluser.uid);
      //     docid.clear();
      //     nombre.clear();   
      //     animo.clear();   
      //     lugar.clear();   
   
        
      //   },
      //   child: FaIcon(
      //     FontAwesomeIcons.bullhorn,
      //     color: Colors.amber,
          
      //   ),
      //   backgroundColor: Colors.deepPurple.shade900,
      // ),

    */

    body: getInfo(context, controlp.readItems(), controluser.uid),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AgregarEstado());
        },
        tooltip: 'Refrescar',
        child: Icon(Icons.add,color : Colors.amber,),
        backgroundColor: Colors.deepPurple.shade900,
        
      ),





    );
  }
  
}

@override
Widget getInfo(BuildContext context, Stream<QuerySnapshot> ct, String uid) {
  return StreamBuilder(
    stream: ct,
    /*FirebaseFirestore.instance
        .collection('clientes')
        .snapshots(),*/ //En esta línea colocamos el el objeto Future que estará esperando una respuesta
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      print(snapshot.connectionState);
      switch (snapshot.connectionState) {

        //En este case estamos a la espera de la respuesta, mientras tanto mostraremos el loader
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());

        case ConnectionState.active:
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          // print(snapshot.data);
          return snapshot.data != null
              ? Vistamensajeros(estados: snapshot.data!.docs, uid: uid)
              : Text('Sin Datos');

        /*
             Text(
              snapshot.data != null ?'ID: ${snapshot.data['id']}\nTitle: ${snapshot.data['title']}' : 'Vuelve a intentar', 
              style: TextStyle(color: Colors.black, fontSize: 20),);
            */

        default:
          return Text('Presiona el boton para recargar');
      }
    },
  );
}

class Vistamensajeros extends StatelessWidget {
  final List estados;
  final String uid;
  const Vistamensajeros({required this.estados, required this.uid});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: estados.length == 0 ? 0 : estados.length,
        itemBuilder: (context, posicion) {
          print(estados[posicion].id);
          return Card(
            elevation: 2,
            child: Container(
              padding: const EdgeInsets.only(
                  top: 4.0, bottom: 16.0, left: 8.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(estados[posicion]['photo']),
                      ),
                      const SizedBox(
                        width: 14.0,
                      ),
                      Expanded(
                        child: Text(
                          estados[posicion]['titulo'],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      (uid == estados[posicion]['uid'])
                          ? IconButton(
                              onPressed: () {
                                Get.to(() => ModificarEstado(
                                      estado: estados,
                                      pos: posicion,
                                      iddoc: estados[posicion].id,
                                    ));
                              },
                              icon: Icon(Icons.edit))
                          : Text('NO'),
                      SizedBox(
                        width: 5.0,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(estados[posicion]['detalle']),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Text(estados[posicion]['name']),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
