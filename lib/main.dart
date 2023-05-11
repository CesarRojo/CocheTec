import 'package:dam_u4_proyecto1_19400664/capturarvehiculo.dart';
import 'package:dam_u4_proyecto1_19400664/navegador.dart';
import 'package:flutter/material.dart';

//Importaciones de firabase
import 'package:firebase_core/firebase_core.dart';
import 'actualizarbitacora.dart';
import 'actualizarvehiculo.dart';
import 'capturarbitacora.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Navegador(),
        '/addV': (context) => const CapturaVehiculo(),
        '/editV': (context) => const EditarVehiculo(),
        '/addB': (context) => const CapturaBitacora(),
        '/editB': (context) => const EditarBitacora(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}