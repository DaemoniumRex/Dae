// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:getglam/controller/camera_controller.dart';

// class CameraScreen extends StatefulWidget {
//   const CameraScreen({Key? key}) : super(key: key);

//   @override
//   _State createState() => _State();
// }

// class _State extends State<CameraScreen> {
//   final CamController camState = Get.find<CamController>();
//   late Future<void> _initializeControllerFuture;

//   @override
//   void initState() {
//     super.initState();
//     camState.controller =
//         CameraController(camState.camera, ResolutionPreset.high);
//     // Next, initialize the controller. This returns a Future.
//     _initializeControllerFuture = camState.controller.initialize();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<void>(
//       future: _initializeControllerFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           // If the Future is complete, display the preview.
//           camState.initialized = true;
//           return CameraPreview(camState.controller);
//         } else {
//           // Otherwise, display a loading indicator.
//           return const Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }

//   @override
//   void dispose() {
//     camState.controller.dispose();
//     super.dispose();
//   }
// }
