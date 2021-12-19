import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
 
class ControllerFirestore extends GetxController {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
 
  Stream<QuerySnapshot> readItems() {
    CollectionReference listado = _db.collection('estados');
 
    return listado.snapshots();
  }
  Stream<QuerySnapshot> readLocations() {
    CollectionReference listado = _db.collection('ubicacion');

    return listado.snapshots();
  }

  Future<void> guardarubicacion(Map<String, dynamic> ubicacion, uid) async {
    await _db.collection('ubicacion').doc(uid).set(ubicacion).catchError((e) {
      print(e);
    });
    //return true;
  }
 
  Future<void> crearestado(Map<String, dynamic> estados) async {
    await _db.collection('estados').doc().set(estados).catchError((e) {
      print(e);
    });
    //return true;
  }
 
  Future<void> actualizarestado(String id, Map<String, dynamic> estados) async {
    await _db.collection('estados').doc(id).update(estados).catchError((e) {
      print(e);
    });
    //return true;
  }
 
  Future<void> eliminarestados(String id) async {
    await _db.collection('estados').doc(id).delete().catchError((e) {
      print(e);
    });
    //return true;
  }
}
