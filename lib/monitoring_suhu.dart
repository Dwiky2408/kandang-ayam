import 'package:flutter/material.dart';

class MonitoringSuhuPage extends StatelessWidget {
  final double suhu = 28.0; // Suhu dalam derajat Celsius
  final double kelembapan = 75.0; // Kelembapan dalam persen

  String cekStatusSuhu(double suhu) {
    if (suhu < 18) {
      return 'Terlalu Dingin';
    } else if (suhu >= 18 && suhu <= 30) {
      return 'Normal';
    } else {
      return 'Terlalu Panas';
    }
  }

  String cekStatusKelembapan(double kelembapan) {
    if (kelembapan < 40) {
      return 'Terlalu Kering';
    } else if (kelembapan >= 40 && kelembapan <= 80) {
      return 'Normal';
    } else {
      return 'Terlalu Lembab';
    }
  }

  @override
  Widget build(BuildContext context) {
    String statusSuhu = cekStatusSuhu(suhu);
    String statusKelembapan = cekStatusKelembapan(kelembapan);

    return Scaffold(
      appBar: AppBar(
        title: Text('Monitoring Suhu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Suhu: $suhu °C',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Status Suhu: $statusSuhu',
                      style: TextStyle(
                        fontSize: 18,
                        color:
                            statusSuhu == 'Normal' ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Kelembapan: $kelembapan%',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Status Kelembapan: $statusKelembapan',
                      style: TextStyle(
                        fontSize: 18,
                        color: statusKelembapan == 'Normal'
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
