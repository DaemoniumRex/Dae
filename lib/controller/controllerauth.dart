import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getglam/ui/pages/dashboard/dash_page.dart';
import 'package:getglam/ui/routes/app_routes.dart';
import 'package:getglam/ui/routes/app_pages.dart';

class Controllerauth extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late Rx<dynamic> _usuarior = "Sin registro".obs;


  String get userf => _usuarior.value;
 
  Future<void> registrarEmail(dynamic _email, dynamic _passw) async {
   
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
    
    
    


Future<void> sLogin(dynamic _email, dynamic _passw) async {
   
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






    
    
    //final formKey = GlobalKey<FormState>();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
    
    Future<void> signInWithEmailAndPassword(dynamic email, dynamic passw) async {
    try {
      final User user = (await auth.signInWithEmailAndPassword(
        email: email,
        password: passw,
      ))
          .user!;
      Get.snackbar('Hola', 'logro ingresar!');
      print('Ingreso bien');
      Future.delayed(
        Duration(seconds: 2), 
        () {
          //Get.toNamed("DASHBOARD");
          //getPages: AppPages.list;
          Get.toNamed("DASHBOARD");
        }
      );
    } catch (e) {
      Get.snackbar('oops','algo salio muy mal',
      snackPosition: SnackPosition.BOTTOM);
    }
  }
}
    
    
    
    
    
    
    


    