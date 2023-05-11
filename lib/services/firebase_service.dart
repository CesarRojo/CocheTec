import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dam_u4_proyecto1_19400664/services/Bitacora.dart';
import 'package:dam_u4_proyecto1_19400664/services/Vehiculo.dart';

FirebaseFirestore db = FirebaseFirestore.instance; //Hacer una instancia de FirebaseFirestore (la bd)

//Future que nos va regresar una lista de los datos que se tengan en la base
Future<List> getVehiculos() async{
  List vehiculos = [];
  //Hacer una referencia a la coleccion de la que se quieren sacar los datos
  CollectionReference coleccionVehiculos = db.collection('vehiculo');
  //Forma de obtener los datos de la coleccion que creamos anteriormente (regresa todos los valores/documentos)
  QuerySnapshot queryVehiculo = await coleccionVehiculos.get();

  //inicia un ciclo for que recorre cada documento en la lista queryVehiculo.docs.
  //La variable doc representa cada documento en cada iteración.
  for(var doc in queryVehiculo.docs){

    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final vehiculo = {
      "placa": data['placa'],
      "tipo": data['tipo'],
      "numeroserie": data['numeroserie'],
      "combustible": data['combustible'],
      "tanque": data['tanque'],
      "trabajador": data['trabajador'],
      "depto": data['depto'],
      "resguardadopor": data['resguardadopor'],
      "id": doc.id,
    };
    vehiculos.add(vehiculo);
  }
  return vehiculos;
}

Future<void> addVehiculo(Vehiculo v) async{
  await db.collection('vehiculo').add(v.toMap());
}

Future<void> updateVehiculo(String id, Vehiculo v) async{
  await db.collection('vehiculo').doc(id).set(v.toMap());
}

Future<void> deleteVehiculo(String id) async{
  await db.collection('vehiculo').doc(id).delete();
}







//==================================================================================================
Future<List> getBitacoras() async{
  List bitacoras = [];

  CollectionReference colBitacora = db.collection('bitacora');
  QuerySnapshot queryBitacora = await colBitacora.get();

  for(var doc in queryBitacora.docs){
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final bitacora = {
      "fecha": data['fecha'],
      "evento": data['evento'],
      "recursos": data['recursos'],
      "verifico": data['verifico'],
      "fechaverificacion": data['fechaverificacion'],
      "idVehiculo": data['idVehiculo'],
      "id": doc.id,
    };
    bitacoras.add(bitacora);
  }
  return bitacoras;
}

Future<void> addBitacora(Bitacora b) async{
  await db.collection('bitacora').add(b.toMap());
}

Future<void> updateBitacora(String id, Bitacora b) async{
  await db.collection('bitacora').doc(id).set(b.toMap());
}

Future<void> deleteBitacora(String id) async{
  await db.collection('bitacora').doc(id).delete();
}

