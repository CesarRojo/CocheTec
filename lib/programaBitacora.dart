import 'package:dam_u4_proyecto1_19400664/Programa.dart';
import 'package:dam_u4_proyecto1_19400664/services/firebase_service.dart';
import 'package:flutter/material.dart';

class ProgramaBitacoras extends StatefulWidget {
  const ProgramaBitacoras({Key? key}) : super(key: key);

  @override
  State<ProgramaBitacoras> createState() => _ProgramaBitacorasState();
}

class _ProgramaBitacorasState extends State<ProgramaBitacoras> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //FutureBuilder construye contenido basandose en el resultado de una operacion async (obtener datos de Firebase)
      body: FutureBuilder(
          //getBitacoras Devuelve un future que representa una lista de bitacoras obtenidas de Firebase
          future: getBitacoras(),
          builder: ((context, snapshot){
            //Comprobar si snapshot tiene datos
            if(snapshot.hasData){
              //En caso de ser cierto se construye una lista de elementos a partir de una lista de datos con ListView.builder
              return ListView.builder(
                //itemCount: numero de elementos que se tienen que construir en la lista (longitud de la lista de bitacoras)
                //itemBuilder: construye cada elemento de la lista
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      //=============================================================================================
                      showDialog(context: context, builder: (builder){
                        return AlertDialog(
                          title: Text("ATENCIÓN"),
                          content: Text("¿Que quieres hacer con esta Bitacora?"),
                          actions: [
                            TextButton(onPressed: () async{
                              //Navegar a la ruta especificada con Navigator.pushNamed (/editB)
                              await Navigator.pushNamed(context, '/editB', arguments: {
                                //Pasar un map con valores como argumentos a la ruta
                                "fecha": snapshot.data?[index]['fecha'],
                                "evento": snapshot.data?[index]['evento'],
                                "recursos": snapshot.data?[index]['recursos'],
                                "verifico": snapshot.data?[index]['verifico'],
                                "fechaverificacion": snapshot.data?[index]['fechaverificacion'],
                                "idVehiculo": snapshot.data?[index]['idVehiculo'],
                                "id": snapshot.data?[index]['id'],
                              });
                              //setState importante para que al volver a la pantalla se actualize con los datos
                              setState(() { });
                            }, child: const Text("ACTUALIZAR")),
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child: const Text("NADA")),
                          ],
                        );
                      });
                      //=============================================================================================
                    },
                    child: ListTile(
                      title: Text(snapshot.data?[index]['evento'] + ' - ' + snapshot.data?[index]['idVehiculo']),
                      subtitle: Text(snapshot.data?[index]['id']),
                      trailing: Text(snapshot.data?[index]['verifico']),
                    ),
                  );
                },);
            }else{
              //Mostrar una desas rueditas de carga nomas pa saber que estan cargando los datos asies
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async{
        //Navegar a la ruta especificada con Navigator.pushNamed (/addB)
        //Despues el then hace que al volver a la pantalla se ejecute el setState para
        //actualizar los datos
        await Navigator.pushNamed(context, '/addB').then((value) {
          setState(() {
            ProgramaBitacoras();
          });
        },);
      },child: Icon(Icons.add), backgroundColor: Colors.blue,),
    );
  }
}
