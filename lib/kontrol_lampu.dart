import 'package:flutter/material.dart';

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

class LampuKontrolScreen extends StatefulWidget {
  @override
  _LampuKontrolScreenState createState() => _LampuKontrolScreenState();
}

class _LampuKontrolScreenState extends State<LampuKontrolScreen> {
  bool isLampuOn = false;

  void toggleLampu() {
    setState(() {
      isLampuOn = !isLampuOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kontrol Lampu"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isLampuOn ? Icons.lightbulb : Icons.lightbulb_outline,
              color: isLampuOn ? Colors.yellow : Colors.grey,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              isLampuOn ? "Lampu Menyala" : "Lampu Mati",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: toggleLampu,
              child: Text(isLampuOn ? "Matikan Lampu" : "Nyalakan Lampu"),
            ),
          ],
        ),
      ),
    );
  }
}
