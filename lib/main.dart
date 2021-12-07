


import 'package:flutter/material.dart';
import 'package:getglam/controller/controlrealtime.dart';
import 'package:getglam/ui/app.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getglam/controller/controllerauth.dart';
import 'package:getglam/controller/chat_controller.dart';



Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(Controllerauth());
  Get.put(ControllerRealtime());
  Get.put(ChatController());

  runApp(const MyApp());
}




/*import 'package:flutter/material.dart';
import 'package:getglam/ui/app.dart';


void main() {
  runApp( MyApp());
}

*/