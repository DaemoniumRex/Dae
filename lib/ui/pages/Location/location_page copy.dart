// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:getglam/controller/controllerfirestore.dart';
// import 'package:getglam/controller/controllerauth.dart';
// import 'package:getglam/controller/perfil_controller.dart';
// import 'package:getglam/controller/themecontroller.dart';
// import 'package:getglam/ui/pages/camera/camera_screen.dart';
// import 'package:getglam/ui/pages/preview/preview_screen.dart';
// import 'package:getglam/ui/widgets/appbar.dart';
// import 'package:getglam/ui/widgets/button_widget.dart';
// import 'package:getglam/ui/widgets/numbers_widget.dart';
// import 'package:getglam/ui/widgets/profile_widget.dart';

// import 'package:getglam/ui/pages/home/editarestados.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:getglam/ui/widgets/button_widget.dart';
// import 'package:getglam/ui/widgets/numbers_widget.dart';
// import 'package:getglam/ui/widgets/profile_widget.dart';
// import 'package:getglam/ui/pages/camera/camera_page.dart';
// import 'package:getglam/controller/loc_cont.dart';
// import 'package:getglam/controller/locations.dart';


// class Loc_page extends StatefulWidget {
//   @override
//   _Loc_pageState createState() => _Loc_pageState();
// }
// class _Loc_pageState extends State<Loc_page> {
//  final ThemeController controller = Get.find();
//     final Controllerauth controluser = Get.find();
//     ControllerFirestore controlp = Get.find();
//     LocCont LocControl = Get.find();
//     Controllerlocations controlubicacion = Get.find();

//      @override
//   void initState() {
//     super.initState();
//     controlubicacion.obtenerubicacion();
//   }

//   @override
//   Widget build(BuildContext context) {
   

    
//     //camaracontrol
//      //final CamController camState = Get.find<CamController>();

    
//     // String user = controluser.name;
//     // String email = controluser.userf;

//     return Scaffold(
      
//         appBar: CustomAppBar(
//           controller: controller,
//           context: context,
//           controluser: controluser,
//         ),
//       //  
//         body: Column(
//         children: [
//           ListTile(
//             title: Obx(
//               () => Text(
//                   'Lat: ${controlubicacion.locationlat} Lo: ${controlubicacion.locationlo}'),
//             ),
//             subtitle: Text(controluser.name),
//             trailing: IconButton(onPressed: () {}, icon: Icon(Icons.map_sharp)),
//           ),
//           Text('Cerca de mi')
// //getInfo(context, controlp.readItems(), controluser.uid),
//         ],
//       ),
      
//       floatingActionButton: FloatingActionButton(
//         heroTag: 'agamemnon',
//         onPressed: () {
//           controlubicacion.obtenerubicacion();
//           var ubicacion = <String, dynamic>{
//             'lat': controlubicacion.locationlat,
//             'lo': controlubicacion.locationlo,
//             'name': controluser.name,
//             'uid': controluser.uid,
//             'fotoestado': ''
//           };
//           controlp.guardarubicacion(ubicacion, controluser.uid);
//         },
//         tooltip: 'Refrescar',
//         child: Icon(Icons.gps_fixed),
//       ),
      
//       );
//   }
// }


// @override
// Widget getInfo(BuildContext context, Stream<QuerySnapshot> ct, String uid) {
//   return StreamBuilder(
//     stream: ct,
//     /*FirebaseFirestore.instance
//         .collection('clientes')
//         .snapshots(),*/ //En esta línea colocamos el el objeto Future que estará esperando una respuesta
//     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//       print(snapshot.connectionState);
//       switch (snapshot.connectionState) {

//         //En este case estamos a la espera de la respuesta, mientras tanto mostraremos el loader
//         case ConnectionState.waiting:
//           return Center(child: CircularProgressIndicator());

//         case ConnectionState.active:
//           if (snapshot.hasError) return Text('Error: ${snapshot.error}');
//           // print(snapshot.data);
//           return snapshot.data != null
//               ? VistaLocations(estados: snapshot.data!.docs, uid: uid)
//               : Text('Sin Datos');

//         /*
//              Text(
//               snapshot.data != null ?'ID: ${snapshot.data['id']}\nTitle: ${snapshot.data['title']}' : 'Vuelve a intentar', 
//               style: TextStyle(color: Colors.black, fontSize: 20),);
//             */

//         default:
//           return Text('Presiona el boton para recargar');
//       }
//     },
//   );
// }

// class VistaLocations extends StatelessWidget {
//   final List estados;
//   final String uid;
//   const VistaLocations({required this.estados, required this.uid});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: estados.length == 0 ? 0 : estados.length,
//         itemBuilder: (context, posicion) {
//           print(estados[posicion].id);
//           return Card(
//             elevation: 2,
//             child: Container(
//               padding: const EdgeInsets.only(
//                   top: 4.0, bottom: 16.0, left: 8.0, right: 8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Row(
//                     children: [
//                       CircleAvatar(
//                         backgroundImage:
//                             NetworkImage(estados[posicion]['photo']),
//                         backgroundColor: Colors.white,
//                       ),
//                       const SizedBox(
//                         width: 14.0,
//                       ),
//                       Expanded(
//                         child: Text(
//                           estados[posicion]['titulo'],
//                           textAlign: TextAlign.center,
//                           style: Theme.of(context).textTheme.headline6,
//                         ),
//                       ),
//                       (uid == estados[posicion]['uid'])
//                           ? IconButton(
//                               onPressed: () {
//                                 Get.to(() => ModificarEstado(
//                                       estado: estados,
//                                       pos: posicion,
//                                       iddoc: estados[posicion].id,
//                                     ));
//                               },
//                               icon: Icon(Icons.edit))
//                           : Text(''),
//                       SizedBox(
//                         width: 5.0,
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                     child: Text(estados[posicion]['detalle']),
//                   ),
//                   const SizedBox(
//                     height: 6.0,
//                   ),
//                   Container(
//                     child: (estados[posicion]['fotoestado'] != '')
//                         ? Image.network(estados[posicion]['fotoestado'])
//                         : Text(''),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 18.0),
//                     child: Text(estados[posicion]['name']),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }