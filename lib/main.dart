import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:joki/jadwal_pakan.dart';
import 'package:joki/sensor_histori.dart';
import 'login.dart';
import 'change_pass.dart';
import 'firebase_options.dart';
import 'sensor_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Sensor Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    routes: {
      '/sensor': (context) => SensorPage(),
        '/histori': (context) => SensorHistoryPage(),
         '/feeding': (context) => ServoScheduler(),
         '/ganti': (context) => ChangePasswordPage(),
    }
    );
  }

}
