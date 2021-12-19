/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getglam/controller/camcont.dart';
import 'package:getglam/controller/controllerauth.dart';
import 'package:getglam/controller/perfil_controller.dart';
import 'package:getglam/controller/themecontroller.dart';
import 'package:getglam/ui/pages/camera/camera_screen.dart';
import 'package:getglam/ui/pages/preview/preview_screen.dart';
import 'package:getglam/ui/widgets/appbar.dart';
import 'package:getglam/ui/widgets/button_widget.dart';
import 'package:getglam/ui/widgets/numbers_widget.dart';
import 'package:getglam/ui/widgets/profile_widget.dart';



import 'package:getglam/ui/widgets/button_widget.dart';
import 'package:getglam/ui/widgets/numbers_widget.dart';
import 'package:getglam/ui/widgets/profile_widget.dart';
import 'package:getglam/ui/pages/camera/camera_page.dart';
import 'package:getglam/controller/loc_cont.dart';

class Loc_page extends GetView<LocCont> {

// int indexo = 0;
//   // View content
//   Widget _getScreen(int index) {
//     if (indexo == 0) {
//       return const CameraScreen();
//     }else{
//     return const PreviewScreen();
//     }
//   }

  @override
  Widget build(BuildContext context) {
    final ThemeController controller = Get.find();
    final Controllerauth controluser = Get.find();
    
    //camaracontrol
     //final CamController camState = Get.find<CamController>();

    
    String user = controluser.name;
    String email = controluser.userf;

    return Scaffold(
      
        appBar: CustomAppBar(
          controller: controller,
          context: context,
          controluser: controluser,
        ),
      //  

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
                
                    onPressed: () async { },
                child: const Text('Launch Camera'),
              ),
          //Column(
            
          // children: [
              
          //       Builder(
          //     builder: (context) => Scaffold(
          //       body: ListView(
          //         physics: BouncingScrollPhysics(),
          //         children: [
          //           ProfileWidget(
          //             imagePath: controluser.photo,
          //             onClicked: () {
          //             //   Navigator.of(context).push(
          //             //     MaterialPageRoute(builder: (context) => EditProfilePage()),
          //             //   );
          //             },
          //           ),
          //           const SizedBox(height: 24),
          //           buildName(user),
          //           const SizedBox(height: 24),
          //           Center(child: buildUpgradeButton()),
          //           const SizedBox(height: 24),
          //           NumbersWidget(),
          //           const SizedBox(height: 48),
          //           buildAbout(email),
          //         ],
          //       ),
          //     ),
          //   ),

                 
            //],
         // ),
        ),
      ),
      
      );
  }
}*/