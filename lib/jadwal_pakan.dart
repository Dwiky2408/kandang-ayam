import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class JadwalPakanScreen extends StatefulWidget {
  @override
  _JadwalPakanScreenState createState() => _JadwalPakanScreenState();
}

class _JadwalPakanScreenState extends State<JadwalPakanScreen> {
  DateTime _time1 = DateTime.now();
  DateTime _time2 = DateTime.now();

  void _simpanJadwal() {
    String jam1 =
        "${_time1.hour.toString().padLeft(2, '0')}:${_time1.minute.toString().padLeft(2, '0')}";
    String jam2 =
        "${_time2.hour.toString().padLeft(2, '0')}:${_time2.minute.toString().padLeft(2, '0')}";
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Jadwal Pakan Disimpan"),
        content: Text("Jam 1: $jam1\nJam 2: $jam2"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Jadwal Pakan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Pilih Jam 1:", style: TextStyle(fontSize: 16)),
            TimePickerSpinner(
              is24HourMode: true,
              normalTextStyle: TextStyle(fontSize: 18, color: Colors.grey),
              highlightedTextStyle: TextStyle(fontSize: 24, color: Colors.blue),
              onTimeChange: (time) {
                setState(() {
                  _time1 = time;
                });
              },
            ),
            SizedBox(height: 20),
            Text("Pilih Jam 2:", style: TextStyle(fontSize: 16)),
            TimePickerSpinner(
              is24HourMode: true,
              normalTextStyle: TextStyle(fontSize: 18, color: Colors.grey),
              highlightedTextStyle: TextStyle(fontSize: 24, color: Colors.blue),
              onTimeChange: (time) {
                setState(() {
                  _time2 = time;
                });
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _simpanJadwal,
              child: Text("Simpan Jadwal"),
            ),
          ],
        ),
      ),
    );
  }
}
