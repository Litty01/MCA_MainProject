// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class MyDisaster extends StatefulWidget {
  const MyDisaster({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _MyDisasterState createState() => _MyDisasterState();
}

class _MyDisasterState extends State<MyDisaster> {
  final dateFormat = DateFormat("yyyy-MM-dd");
  final timeFormat = DateFormat("HH:mm");

  String? _selectedDistrict;
  final List<String> _districts = [
    'Alappuzha',
    'Ernakulam',
    'Idukki',
    'Kannur',
    'Kasaragod',
    'Kollam',
    'Kottayam',
    'Kozhikode',
    'Malappuram',
    'Palakkad',
    'Pathanamthitta',
    'Thiruvananthapuram',
    'Thrissur',
    'Wayanad',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/disaster.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(0, 213, 222, 221),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(50), // Increased padding here
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Report Disaster',
                  style: TextStyle(color: Colors.white, fontSize: 43),
                ),
                const SizedBox(height: 20),
                TextField(
                  style: const TextStyle(color: Color.fromARGB(255, 235, 232, 232)),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Disaster name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Increased spacing here
                DateTimeField(
                  format: dateFormat,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Disaster Date",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: const Icon(Icons.calendar_today),
                  ),
                  onShowPicker: (context, currentValue) async {
                    return showDatePicker(
                      context: context,
                      firstDate: DateTime(2000),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                  },
                ),
                const SizedBox(height: 20), // Increased spacing here
                DateTimeField(
                  format: timeFormat,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Disaster Time",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: const Icon(Icons.access_time),
                  ),
                  onShowPicker: (context, currentValue) async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                    );
                    return DateTimeField.convert(time);
                  },
                ),
                const SizedBox(height: 20), // Increased spacing here
                DropdownButtonFormField<String>(
                  value: _selectedDistrict,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Select District',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: const Icon(Icons.arrow_drop_down),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedDistrict = value;
                    });
                  },
                  items: _districts.map((String district) {
                    return DropdownMenuItem<String>(
                      value: district,
                      child: Text(district),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Implement action for button click
                  },
                  child: const Text('Report'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
