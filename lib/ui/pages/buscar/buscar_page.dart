import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getglam/controller/buscar_controller.dart';
import 'package:getglam/controller/controllerauth.dart';
import 'package:getglam/controller/themecontroller.dart';
import 'package:getglam/ui/pages/response/screens/response_screen.dart';
import 'package:getglam/ui/widgets/appbar.dart';

class BuscarPage extends GetView<BuscarController> {
//   @override
//   Widget build(BuildContext context) {
//     final ThemeController controller = Get.find();
//     return Scaffold(
// /*
// appBar: AppBar(
//         title: Text(
//           'Mi gente',
//           style: TextStyle(
//           color: Colors.black),
//
//         ),
//         elevation: 0,
//         backgroundColor: Colors.white,
//       ),*/
//         appBar: AppBar(
//           //backgroundColor: Color(0xFF330054),
//           backgroundColor: Colors.purple.shade900,
//           leading: Container(
//             width: 120,
//             height: 120,
//             clipBehavior: Clip.antiAlias,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//             ),
//             child: Image.asset(
//               'assets/img/icon.png',
//             ),
//           ),
//           title: Image.asset(
//             'assets/img/glamtextgente.png',
//             width: 125,
//             fit: BoxFit.contain,
//           ),
//           actions: [
//             Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(0, 10, 20, 6),
//               child: InkWell(
//                 child: Image.asset(
//                   'assets/img/pclosedeyeico.png',
//                   height: 6,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ],
//           centerTitle: true,
//           elevation: 10,
//           //shape: BeveledRectangleBorder(
//           //borderRadius: BorderRadius.circular(20)
//           //),
//         ),
//         body: Container(
//           child: ResponseScreen(controller: controller),
//           //   Center(
//           //     /*child: Column(
//           //     mainAxisAlignment: MainAxisAlignment.center,
//           //     crossAxisAlignment: CrossAxisAlignment.center,
//           //     children: [
//           //       Obx(() => Text("Counter ${controller.counter.value}")),
//           //       RaisedButton(
//           //         child: Text("Increase"),
//           //         onPressed: () => controller.increaseCounter(),
//           //       )
//           //     ],
//           // */
//           //
//           //     child: Text(
//           //       "Alerts Page",
//           //       style: TextStyle(fontSize: 20),
//           //     ),
//           //   ),
//         ));
//   }

  final Controllerauth controluser = Get.find();



  @override
  Widget build(BuildContext context) {
    final ThemeController controller = Get.find();
    return Scaffold(
      appBar: CustomAppBar(
        controller: controller,
        controluser: controluser,
        context: context,
      ),
      // AppBar(
      //   //backgroundColor: Color(0xFF330054),
      //   backgroundColor: Colors.purple.shade900,
      //   leading: Container(
      //     width: 120,
      //     height: 120,
      //     clipBehavior: Clip.antiAlias,
      //     decoration: BoxDecoration(
      //       shape: BoxShape.circle,
      //     ),
      //     child: Image.asset(
      //       'assets/img/icon.png',
      //     ),
      //   ),
      //   title: Image.asset(
      //     'assets/img/glamtextgente.png',
      //     width: 125,
      //     fit: BoxFit.contain,
      //   ),
      //   actions: [
      //     Padding(
      //       padding: EdgeInsetsDirectional.fromSTEB(0, 10, 20, 6),
      //       child: InkWell(
      //         child: Image.asset(
      //           'assets/img/pclosedeyeico.png',
      //           height: 6,
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //     ),
      //   ],
      //   centerTitle: true,
      //   elevation: 10,
      //   //shape: BeveledRectangleBorder(
      //   //borderRadius: BorderRadius.circular(20)
      //   //),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: ResponseScreen(controller: controller),
        ),
      ),
    );
  }
}
