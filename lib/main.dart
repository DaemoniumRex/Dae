
import 'package:camera/camera.dart';
import 'package:getglam/controller/camera_controller.dart';


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getglam/controller/camera_controller.dart';
import 'package:getglam/controller/controlrealtime.dart';
import 'package:getglam/ui/app.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getglam/controller/controllerauth.dart';
import 'package:getglam/controller/chat_controller.dart';

import 'package:getglam/controller/controllerfirestore.dart';
import 'package:getglam/controller/locations.dart';



Future<void> main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(Controllerauth());
  Get.put(ControllerRealtime());
  Get.put(ChatController());
  Get.put(ControllerFirestore()); 
  Get.put(Controllerlocations());
  //Get.put(CamController());

// final cameras = await availableCameras();

// final firstCamera = cameras.first;
// final LastCamera = cameras.last;

  runApp(const MyApp(
   //camera: LastCamera,
  ));
}

signOutDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = IconButton(
      key: Key("cSOButton"),
      color: Colors.white,
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: FaIcon(
        FontAwesomeIcons.solidTimesCircle,
        color: new Color.fromRGBO(220, 53, 69, 1),
      ),);
  Widget continueButton = IconButton(
    key: Key("sOButton"),
    color: Colors.white,
    onPressed: () {
      Navigator.of(context).pop();
      Controllerauth().signOut();
    },
    icon: FaIcon(
      FontAwesomeIcons.checkCircle,
      color: new Color.fromRGBO(40, 167, 69, 1),
    ),);
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Cerrar Sesión"),
    content: Text("Estás seguro de que quieres salir?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}




/*import 'package:flutter/material.dart';
import 'package:getglam/ui/app.dart';


void main() {
  runApp( MyApp());
}

*/