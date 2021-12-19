import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getglam/controller/controllerauth.dart';
import 'package:getglam/controller/perfil_controller.dart';
import 'package:getglam/controller/themecontroller.dart';
import 'package:getglam/ui/widgets/appbar.dart';
import 'package:getglam/ui/widgets/button_widget.dart';
import 'package:getglam/ui/widgets/numbers_widget.dart';
import 'package:getglam/ui/widgets/profile_widget.dart';
import 'package:getglam/ui/pages/camera/camera_page.dart';
import 'package:getglam/controller/camcont.dart';



class PerfilPage extends GetView<perfilController> {

  @override
  Widget build(BuildContext context) {
    final ThemeController controller = Get.find();
    final Controllerauth controluser = Get.find();
    String user = controluser.name;
    String email = controluser.userf;

    return Scaffold(
        appBar: CustomAppBar(
          controller: controller,
          context: context,
          controluser: controluser,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child:Builder(
            builder: (context) => Scaffold(
              body: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  ProfileWidget(
                    imagePath: controluser.photo,
                    onClicked: () {
                    //   Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => EditProfilePage()),
                    //   );
                    },
                  ),
                  const SizedBox(height: 24),
                  buildName(user),
                  const SizedBox(height: 24),
                  Center(child: buildUpgradeButton(context)),
                  const SizedBox(height: 24),
                  NumbersWidget(),
                  const SizedBox(height: 48),
                  buildAbout(email),

              //     ElevatedButton(
                                   
              //       onPressed: () async {
              //        await availableCameras().then(
              //       (value) => Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => CameraPage(cameras: value,),
              //                           ),
              //                             ),
              //                               );
              //                                    },
              //   child: const Text('presiona aqui'),
              // ),
                ],
              ),
            ),
          ),)
        ));
  }


  Widget buildName(String user) => Column(
    children: [
      Text(
        user,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        user,
        style: TextStyle(color: Colors.grey),
      )
    ],
  );

  Widget buildUpgradeButton(BuildContext context) => ButtonWidget(
    text: 'Hora de un retoque!',
    onClicked:  () async {
                     await availableCameras().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CameraPage(cameras: value,),
                                        ),
                                          ),
                                            );
                                                 },
  );

  Widget buildAbout(String email) => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          email,
          style: TextStyle(fontSize: 16, height: 1.4),
        ),
      ],
    ),
  );

}
