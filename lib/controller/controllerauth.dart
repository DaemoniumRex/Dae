import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getglam/ui/pages/dashboard/dash_page.dart';
import 'package:getglam/ui/routes/app_routes.dart';
import 'package:getglam/ui/routes/app_pages.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:getglam/ui/pages/login/loginpage.dart';



class Controllerauth extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late Rx<dynamic> _usuarior = "Sin registro".obs;
  late Rx<dynamic> _uid = "".obs;
  late Rx<dynamic> _name = "".obs;
  late Rx<dynamic> _photo = "".obs;

  String get userf => _usuarior.value;
  String get uid => _uid.value;

  String get name => _name.value;
  String get photo => _photo.value;
 
  Future<void> registrarEmail(dynamic _email, dynamic _passw) async {
   
    try {
     
      UserCredential usuario = await auth.createUserWithEmailAndPassword(
          email: _email, password: _passw);
         
         _usuarior.value = usuario.user!.email;
         _uid.value = usuario.user!.uid;
          _usuarior.value = usuario.user!.displayName;

        _name.value = usuario.user!.photoURL;

         _photo.value = "https://cdn.icon-icons.com/icons2/1508/PNG/512/systemusers_104569.png";
         /*usuario.user!.email;*/

      print(usuario);
      await guardarusuario(_usuarior.value, _passw);
     
      return Future.value(true);
      // return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error('Lo siento, no acepto claves escualidas.');
      } else if (e.code == 'email-already-in-use') {
        print('Correo ya Existe');
 
        return Future.error('Lo siento, este email ya se encuentra registrado');
      }
    } catch (e) {
      print(e);
    }}
    
    
    


/*Future<void> sLogin(dynamic _email, dynamic _passw) async {
   
    try {
     
      UserCredential usuario = await auth.createUserWithEmailAndPassword(
          email: _email, password: _passw);
         
         _usuarior.value = usuario.user!.email;
      print(usuario);
 
     
      return Future.value(true);
      // return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('Correo ya Existe');
 
        return Future.error('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }}


*/



    
    
    //final formKey = GlobalKey<FormState>();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
    
    Future<void> signInWithEmailAndPassword(dynamic email, dynamic passw) async {
    try {
      UserCredential usuario =
          await auth.signInWithEmailAndPassword(email: email, password: passw);
                _usuarior.value = usuario.user!.email;
                _uid.value = usuario.user!.uid; 
                // _name.value = usuario.user!.displayName;
                // _photo.value = usuario.user!.photoURL;

      // final User user = (await auth.signInWithEmailAndPassword(
      //   email: email,
      //   password: passw,
      // ))
      //     .user!;
      Get.snackbar('${usuario.user!.email}' , 'Wow, que bien te ves!',);
      //print('Hi! ${usuario} ');
      //Get.toNamed("DASHBOARD");
      //Future.value(true);
      await guardarusuario(_usuarior.value, passw);


      return Future.delayed(
        Duration(milliseconds: 1500), 
        () {
          //Get.toNamed("DASHBOARD");
          //getPages: AppPages.list;
          Get.toNamed("DASHBOARD");
        });
      
    } catch (e) {
      Get.snackbar('Nope','algo salio muy mal',
      snackPosition: SnackPosition.BOTTOM);
    }
  }


Future<void> ingresarGoogle() async {
    // Trigger the authentication flow
 
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
// Obtain the auth details from the request
 
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
 
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
  UserCredential usuario = await FirebaseAuth.instance.signInWithCredential(credential);
      // Once signed in, return the UserCredential
    
      _usuarior.value = usuario.user!.email;
      _uid.value = usuario.user!.uid;

      _name.value = usuario.user!.displayName;
      _photo.value = usuario.user!.photoURL;
      //_usuarior.value = usuario.user!.email;
      Get.snackbar('${usuario.user!.email}' , 'Wow, que bien te ves!',);
      Get.toNamed("DASHBOARD");
      return Future.value(true);
      
    } catch (e) {
      return Future.error('Error');
    }
    
  }
  
Future<void> guardarusuario(datos, passw) async {
  Future<SharedPreferences> _localuser = SharedPreferences.getInstance();
  final SharedPreferences localuser = await _localuser;
  //localuser.setString('usuario', datos);
  localuser.setString('email', datos);
  localuser.setString('clave', passw);

  print(localuser.getString('usuario'));
}

Future<void> signOut() async {
    try {
      await auth.signOut();
      Get.to(() => Login());
      Get.snackbar(
        'Sesión Cerrada','Nos vemos luego!'
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar('algo salio muy mal', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  String getUid(){
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return uid;
  }


 }