import 'package:get/get.dart';
import 'package:getglam/controller/controllerauth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usuario = TextEditingController();
  TextEditingController passwd = TextEditingController();
  //realtime
  Controllerauth controluser = Get.find();

  _login(theEmail, thePassword) async {
    print('_login $theEmail $thePassword');
    try {
      await controluser.registrarEmail(theEmail, thePassword);
      //Get.to(inicio());
      Get.toNamed("DASHBOARD");
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

  _iniLogin(theEmail, thePassword) async {
    print('_login $theEmail $thePassword');
    try {
      await controluser.signInWithEmailAndPassword(theEmail, thePassword);
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


_google() async {
    try {
      await controluser.ingresarGoogle();
      //Get.to(() => ListaMensajes());
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
  void initState() {
    super.initState();
    autoLogIn();
  }

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? email = prefs.getString('email');
    final String? passw = prefs.getString('clave');


    if (email != null) {
      setState(() {
        usuario.text = email;
        passwd.text = passw!;
        //si queremos obviar el presionar el boton de login
        //_inicio(usuario.text, passwd.text);

      });
      return;
    }
  }








  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/makeup.jpg"),
            
            fit: BoxFit.cover,
          ),
        ),

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
                decoration: InputDecoration(
                    hintText: 'Ingrese correo',
                    hintStyle: new TextStyle(color: Colors.white),
                    labelStyle: new TextStyle(color: const Color(0xFF424242)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple.shade900),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple.shade900),
                    ),
                )
            ),
            TextField(
                controller: passwd,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Ingrese clave',
                    hintStyle: new TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple.shade800),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple.shade800),
                    ),
                )
            ),
            // TextField(
            //   key: Key("emailInput"),
            //     controller: usuario,
            //     decoration: InputDecoration(hintText: 'ingrese correo')),
            // TextField(
            //   key: Key("passwInput"),
            //     controller: passwd,
            //     obscureText: true,
            //     decoration: InputDecoration(hintText: 'ingrese clave')),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                                key: Key("siButt"),

                    onPressed: () {
                      _iniLogin(usuario.text, passwd.text);

                      // controluser.signInWithEmailAndPassword(
                      //     usuario.text, passwd.text);
                    },
                    icon: Icon(Icons.login_outlined)),
                IconButton(
                  key: Key("regButt"),
                    onPressed: () {
                      _login(usuario.text, passwd.text);
                    },
                    icon: Icon(Icons.app_registration_outlined)),
              ],
            ),
            Obx(() => Text(controluser.userf)),
          ],
        ),
      ),),
      
    ),
    floatingActionButton: FloatingActionButton(
      
  onPressed:(){
    _google();
  },
  child: FaIcon(
    FontAwesomeIcons.google,
    color : Colors.white,
  ),
  backgroundColor: Colors.deepPurple.shade900,
  //Icon(Icons.add),
),);
  }
}
