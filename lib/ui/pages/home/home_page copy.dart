/*import'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:getglam/ui/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:getglam/controller/controlrealtime.dart';
import 'package:getglam/controller/home_controller.dart';
import 'package:getglam/controller/controllerauth.dart';

import 'package:getglam/domain/model/Post.dart';




class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
TextEditingController docid = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController animo = TextEditingController();
  TextEditingController lugar = TextEditingController();
 // TextEditingController telefono = TextEditingController();




  @override
  Widget build(BuildContext context) {
    // return Container();
//   }
// }


// class HomePage extends GetView<HomeController> {
//   @override
//   Widget build(BuildContext context) {

    HomeController homeController= Get.find();
    Controllerauth controluser = Get.find();
    ControllerRealtime controlrt = Get.find();




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

      body:
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
        



        


        floatingActionButton: FloatingActionButton(
        onPressed: () {
          controlrt.createData(docid.text, nombre.text, animo.text, lugar.text,controluser.uid);
          docid.clear();
          nombre.clear();   
          animo.clear();   
          lugar.clear();   
   
        
        },
        child: FaIcon(
          FontAwesomeIcons.bullhorn,
          color: Colors.amber,
          
        ),
        backgroundColor: Colors.deepPurple.shade900,
      ),


    );
  }
  
}*/