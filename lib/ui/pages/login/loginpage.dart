//import 'package:getglam/ui/pages/inicio.dart';
import 'package:get/get.dart';
import 'package:getglam/controller/controllerauth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usuario = TextEditingController();
  TextEditingController passwd = TextEditingController();
  Controllerauth controluser = Get.find();

  _login(theEmail, thePassword) async {
    print('_login $theEmail $thePassword');
    try {
      await controluser.registrarEmail(theEmail, thePassword);
      //Get.to(inicio());
    } catch (err) {
      print(err.toString());
      Get.snackbar(
        "Login",
        err.toString(),
        icon: Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        /*decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/makeup.jpg"),
            
            fit: BoxFit.cover,
          ),
        ),*/

      child: Center(
          child: Padding(
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
  
                'assets/img/glamlogp.png',
  
                width: 100,
  
                height: 170,
  
                fit: BoxFit.cover,),
            /*Container(
              child: Image.asset(
  
                'assets/img/makeup.jpg',
  
                width: 100,
  
                height: 150,
  
                fit: BoxFit.contain,)
            ),*/
            /*CircleAvatar(
              radius: 100.0,

              //child: Image.asset('assets/img/icon.png'),

              backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/profile_images/1377794300440936450/QRyFJOWy_400x400.jpg'),
            ),*/


            SizedBox(
              height: 20,
            ),
            TextField(
                controller: usuario,
                decoration: InputDecoration(hintText: 'ingrese correo')),
            TextField(
                controller: passwd,
                obscureText: true,
                decoration: InputDecoration(hintText: 'ingrese clave')),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      /*if (usuario.text == "demo" && passwd.text == "demo1234"){
  
            Get
  
          }
  
          */

                      controluser.signInWithEmailAndPassword(
                          usuario.text, passwd.text);
                    },
                    icon: Icon(Icons.login_outlined)),
                IconButton(
                    onPressed: () {
                      _login(usuario.text, passwd.text);
                    },
                    icon: Icon(Icons.app_registration_outlined)),
              ],
            ),
            Obx(() => Text(controluser.userf)),
          ],
        ),
      )),
    ));
  }
}
