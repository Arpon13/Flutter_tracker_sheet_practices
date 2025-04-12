import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StylishDateTimePicker(),
  ));
}

class StylishDateTimePicker extends StatefulWidget {
  const StylishDateTimePicker({super.key});

  @override
  State<StylishDateTimePicker> createState() => _StylishDateTimePickerState();
}

class _StylishDateTimePickerState extends State<StylishDateTimePicker> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _pickDate() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (date != null) {
      setState(() => selectedDate = date);
    }
  }

  Future<void> _pickTime() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (time != null) {
      setState(() => selectedTime = time);
    }
  }

  String get formattedDate {
    if (selectedDate == null) return "No date selected";
    return "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}";
  }

  String get formattedTime {
    if (selectedTime == null) return "No time selected";
    final hour = selectedTime!.hour.toString().padLeft(2, '0');
    final minute = selectedTime!.minute.toString().padLeft(2, '0');
    return "$hour:$minute";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: const Text("Date & Time Picker"),
        backgroundColor: Colors.lightGreenAccent,
        centerTitle: true,
        elevation: 3,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 15,
                spreadRadius: 5,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: _pickDate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                ),
                icon: const Icon(Icons.calendar_today, size: 20),
                label: const Text("Pick Date", style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 16),
              Text(
                "Selected Date:\n$formattedDate",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 17, color: Colors.black87, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: _pickTime,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                ),
                icon: const Icon(Icons.access_time, size: 20),
                label: const Text("Pick Time", style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 16),
              Text(
                "Selected Time:\n$formattedTime",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 17, color: Colors.black87, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
