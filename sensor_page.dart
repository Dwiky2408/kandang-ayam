import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class SensorPage extends StatefulWidget {
  const SensorPage({Key? key}) : super(key: key);

  @override
  State<SensorPage> createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {
  final DatabaseReference _database =
      FirebaseDatabase.instance.ref('/cageData'); // Path di Firebase
  Map<dynamic, dynamic>? _latestSensorData;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _fetchLatestSensorData();
  }

  void _fetchLatestSensorData() {
    // Listen untuk mendapatkan data terbaru dari Firebase
    _database.limitToLast(1).onValue.listen((event) {
      final data = event.snapshot.value;
      if (data is Map) {
        final latestKey = data.keys.first;
        final latestValue = data[latestKey] as Map<dynamic, dynamic>;
        setState(() {
          _latestSensorData = latestValue;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser; // Get current logged-in user

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensor Data'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(user?.displayName ?? 'No Name'),
              accountEmail: Text(user?.email ?? 'No Email'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.account_circle,
                  size: 50,
                  color: Colors.blue,
                ),
              ),
            ),
            ListTile(
              title: const Text('Change Password'),
              leading: const Icon(Icons.password),
              onTap: () {
                Navigator.pushNamed(context, '/ganti');
              },
            ),
            ListTile(
              title: const Text('Logout'),
              leading: const Icon(Icons.logout),
              onTap: () {
                _auth.signOut();
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      body: _latestSensorData == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Card(
                    elevation: 5,
                    margin: const EdgeInsets.all(20),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.sensors,
                            size: 60,
                            color: Colors.blue,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Temperature: ${_latestSensorData!['temperature']}°C',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'MQ135: ${_latestSensorData!['mq135']}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Timestamp: ${_latestSensorData!['timestamp']}',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Tambahkan Tombol Navigasi
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/histori');
                    },
                    child: const Text('Lihat Histori Sensor'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/feeding');
                    },
                    child: const Text('Jadwal Pakan'),
                  ),
                ),
              ],
            ),
    );
  }
}
