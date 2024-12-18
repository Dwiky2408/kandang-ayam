import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ServoScheduler extends StatefulWidget {
  @override
  _ServoSchedulerState createState() => _ServoSchedulerState();
}

class _ServoSchedulerState extends State<ServoScheduler> {
  int selectedHour = 8;
  int selectedMinute = 0;
  final databaseRef = FirebaseDatabase.instance.ref("servoSchedule");

  void updateSchedule() {
    databaseRef.set({
      "hour": selectedHour,
      "minute": selectedMinute,
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Jadwal servo berhasil diperbarui!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Servo Scheduler")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<int>(
                value: selectedHour,
                items: List.generate(24, (index) {
                  return DropdownMenuItem(
                    value: index,
                    child: Text("$index"),
                  );
                }),
                onChanged: (value) {
                  setState(() {
                    selectedHour = value!;
                  });
                },
              ),
              Text(" : "),
              DropdownButton<int>(
                value: selectedMinute,
                items: List.generate(60, (index) {
                  return DropdownMenuItem(
                    value: index,
                    child: Text("$index"),
                  );
                }),
                onChanged: (value) {
                  setState(() {
                    selectedMinute = value!;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: updateSchedule,
            child: Text("Atur Jadwal Servo"),
          ),
        ],
      ),
    );
  }
}
