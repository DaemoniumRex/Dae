import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:getglam/controller/controllerfirestore.dart';
import 'package:getglam/controller/controllerauth.dart';
import 'package:getglam/controller/perfil_controller.dart';
import 'package:getglam/controller/themecontroller.dart';
import 'package:getglam/ui/pages/camera/camera_screen.dart';
import 'package:getglam/ui/pages/preview/preview_screen.dart';
import 'package:getglam/ui/widgets/appbar.dart';
import 'package:getglam/ui/widgets/button_widget.dart';
import 'package:getglam/ui/widgets/numbers_widget.dart';
import 'package:getglam/ui/widgets/profile_widget.dart';
import 'dart:math';
import 'package:getglam/ui/pages/home/editarestados.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:getglam/ui/widgets/button_widget.dart';
import 'package:getglam/ui/widgets/numbers_widget.dart';
import 'package:getglam/ui/widgets/profile_widget.dart';
import 'package:getglam/ui/pages/camera/camera_page.dart';
import 'package:getglam/controller/loc_cont.dart';
import 'package:getglam/controller/locations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workmanager/workmanager.dart';



class Loc_page extends StatefulWidget {
  @override
  _Loc_pageState createState() => _Loc_pageState();
}
class _Loc_pageState extends State<Loc_page> {
 final ThemeController controller = Get.find();
    final Controllerauth controluser = Get.find();
    ControllerFirestore controlp = Get.find();
    LocCont LocControl = Get.find();
    Controllerlocations controlubicacion = Get.find();

     @override
  void initState() {
    super.initState();
    controlubicacion.obtenerubicacion();

    // _initNotificaciones();
    // Workmanager().registerPeriodicTask(
    //   "1",
    //   "locationPeriodicTask",
    // );
  }
  //  _initNotificaciones() async {
  //   final _plugin = FlutterLocalNotificationsPlugin();
  //   const AndroidInitializationSettings initializationSettingsAndroid =
  //       AndroidInitializationSettings("noteye4");
  //   const InitializationSettings initializationSettings =
  //       InitializationSettings(android: initializationSettingsAndroid);
  //   await _plugin.initialize(initializationSettings);
  // }






  @override
  Widget build(BuildContext context) {
   

    
    //camaracontrol
     //final CamController camState = Get.find<CamController>();

    
    // String user = controluser.name;
    // String email = controluser.userf;

    return Scaffold(
      
        appBar: CustomAppBar(
          controller: controller,
          context: context,
          controluser: controluser,
        ),


        body: Obx(
        () => (controlubicacion.locationlat != '')
            ? getInfo(context, controlp.readLocations(), controluser.uid,
                controlubicacion.locationlat, controlubicacion.locationlo)
            : Center(
                child: Icon(Icons.access_alarms_sharp),
              ),
      ),


// return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue[100],
//         title: ListTile(
//           title: Obx(
//             () => Text(
//                 'Lat: ${controlubicacion.locationlat} Lo: ${controlubicacion.locationlo}'),
//           ),
//           subtitle: Text(controluser.name),
//           trailing: IconButton(onPressed: () {}, icon: Icon(Icons.map_sharp)),
//         ),
//       ),
//       body: Obx(
//         () => (controlubicacion.locationlat != '')
//             ? getInfo(context, controlp.readLocations(), controluser.uid,
//                 controlubicacion.locationlat, controlubicacion.locationlo)
//             : Center(
//                 child: Icon(Icons.access_alarms_sharp),
//               ),
//       ),

      //  
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
      
      floatingActionButton: FloatingActionButton(
        heroTag: 'agamemnon',
        onPressed: () {
          controlubicacion.obtenerubicacion();
          var ubicacion = <String, dynamic>{
            'lat': controlubicacion.locationlat,
            'lo': controlubicacion.locationlo,
            'name': controluser.name,
            'uid': controluser.uid,
            //'fotoestado': ''
          };
          controlp.guardarubicacion(ubicacion, controluser.uid);
           displayNotification(
              title: 'Cerca de Mi',
              body: '${controlubicacion.cercanos} Amigos');
        },
        tooltip: 'Refrescar',
        child: Icon(Icons.gps_fixed),
      ),
      
      );
  }

  displayNotification({required String title, required String body}) async {
    final _plugin = FlutterLocalNotificationsPlugin();
    print("doing test");
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await _plugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: 'It could be anything you pass',
    );
  }

}




@override
Widget getInfo(BuildContext context, Stream<QuerySnapshot> ct, String uid, String lat, String lo) {
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
              ? VistaLocations(
                  locations: snapshot.data!.docs, uid: uid, lat: lat, lo: lo)
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


class VistaLocations extends StatelessWidget {
  final List locations;
  final String uid;
  final String lat;
  final String lo;

  const VistaLocations(
      {required this.locations,
      required this.uid,
      required this.lat,
      required this.lo});

@override
  Widget build(BuildContext context) {
    Controllerlocations controlubicacion = Get.find();

    List<Map<String, dynamic>> listacalculo = [];

//*********Calculo de Distancias***********//

    double deg2rad(double deg) {
      return (deg * pi / 180.0);
    }

    double rad2deg(double rad) {
      return (rad * 180.0 / pi);
    }


 String distance(
        double lat1, double lon1, double lat2, double lon2, String unit) {
      double theta = lon1 - lon2;
      double dist = sin(deg2rad(lat1)) * sin(deg2rad(lat2)) +
          cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * cos(deg2rad(theta));
      dist = acos(dist);
      dist = rad2deg(dist);
      dist = dist * 60 * 1.1515;
      if (unit == 'K') {
        dist = dist * 1.609344;
      } else if (unit == 'N') {
        dist = dist * 0.8684;
      }
      return dist.toStringAsFixed(2);
    }

    for (int i = 0; i < locations.length; i++) {
      if (uid != locations[i]['uid']) {
        String distancia = distance(
            double.parse(lat),
            double.parse(lo),
            double.parse(locations[i]['lat']),
            double.parse(locations[i]['lo']),
            'K');

        var calc = <String, dynamic>{
          'name': locations[i]['name'],
          'lat': locations[i]['lat'],
          'lo': locations[i]['lo'],
          'Dist': distancia
        };

        //if (double.parse(distancia) < 200) listacalculo.add(calc);
        listacalculo.add(calc);
      }
    }

    listacalculo.sort((a, b) {
      return a['Dist'].compareTo(b['Dist']);
    });

    controlubicacion.cercanos = listacalculo.length.toString();

    return ListView.builder(
        itemCount: listacalculo.length == 0 ? 0 : listacalculo.length,
        itemBuilder: (context, posicion) {
          print(locations[posicion].id);
          return ListTile(
            leading: IconButton(
              onPressed: () async {
                final url =
                    "https://www.google.es/maps?q=${listacalculo[posicion]['lat']},${listacalculo[posicion]['lo']}";
                await launch(url);
              },
              icon: Icon(Icons.map_sharp),
            ),
            title: Text(
                'Lat: ${listacalculo[posicion]['lat']} Lo: ${listacalculo[posicion]['lat']}'),
            subtitle: Text(listacalculo[posicion]['name']),
            trailing: Container(
              color: Colors.blue,
              height: 30,
              width: 50,
              child: Text(listacalculo[posicion]['Dist']),
            ),
          );
        });
  }
}
