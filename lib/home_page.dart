import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Farm Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard Farm'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MenuItem(
              title: 'Monitoring Suhu',
              icon: Icons.thermostat_outlined,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MonitoringSuhuPage()),
                );
              },
            ),
            SizedBox(height: 20),
            MenuItem(
              title: 'Jadwal Pakan',
              icon: Icons.schedule,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JadwalPakanPage()),
                );
              },
            ),
            SizedBox(height: 20),
            MenuItem(
              title: 'Kontrol Lampu',
              icon: Icons.lightbulb_outline,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KontrolLampuPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  MenuItem({required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Colors.blue),
              SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Dummy page for Monitoring Suhu
class MonitoringSuhuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Monitoring Suhu')),
      body: Center(
        child: Text('Halaman Monitoring Suhu'),
      ),
    );
  }
}

// Dummy page for Jadwal Pakan
class JadwalPakanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Jadwal Pakan')),
      body: Center(
        child: Text('Halaman Jadwal Pakan'),
      ),
    );
  }
}

// Dummy page for Kontrol Lampu
class KontrolLampuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kontrol Lampu')),
      body: Center(
        child: Text('Halaman Kontrol Lampu'),
      ),
    );
  }
}
