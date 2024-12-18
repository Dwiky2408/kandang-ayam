import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class SensorHistoryPage extends StatefulWidget {
  const SensorHistoryPage({Key? key}) : super(key: key);

  @override
  State<SensorHistoryPage> createState() => _SensorHistoryPageState();
}

class _SensorHistoryPageState extends State<SensorHistoryPage> {
  final DatabaseReference _database =
      FirebaseDatabase.instance.ref('/cageData');
  List<Map<dynamic, dynamic>> _sensorData = [];

  @override
  void initState() {
    super.initState();
    _fetchSensorData();
  }

  void _fetchSensorData() {
    _database.onValue.listen((event) {
      final data = event.snapshot.value;
      if (data is Map) {
        List<Map<dynamic, dynamic>> fetchedData = [];
        data.forEach((key, value) {
          fetchedData.add(value as Map<dynamic, dynamic>);
        });
        setState(() {
          _sensorData = fetchedData.reversed.toList(); // Urutkan dari terbaru
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensor History'),
      ),
      body: _sensorData.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _sensorData.length,
              itemBuilder: (context, index) {
                final sensor = _sensorData[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: const Icon(Icons.sensors),
                    title: Text('Temperature: ${sensor['temperature']}°C'),
                    subtitle: Text('MQ135: ${sensor['mq135']}'),
                    trailing: Text('${sensor['timestamp']}'),
                  ),
                );
              },
            ),
    );
  }
}
