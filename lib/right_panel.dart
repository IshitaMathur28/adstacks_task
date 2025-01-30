import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 

class RightPanel extends StatefulWidget { 
  const RightPanel({Key? key}) : super(key: key);

  @override
  State<RightPanel> createState() => _RightPanelState();
}

class _RightPanelState extends State<RightPanel> {
  int currentMonth = DateTime.now().month;
  int currentYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: const Color.fromARGB(255, 46, 63, 91), 
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            const Text(
              "GENERAL 10:00 AM TO 7:00 PM",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            CalendarWidget(
              currentMonth: currentMonth,
              currentYear: currentYear,
              onMonthChanged: (month) {
                setState(() {
                  currentMonth = month;
                });
              },
              onYearChanged: (year) {
                setState(() {
                  currentYear = year;
                });
              },
            ),
            const SizedBox(height: 20),
            EventWidget(title: "Today Birthday", count: 2, icon: Icons.person), 
            const SizedBox(height: 10),
            EventWidget(title: "Anniversary", count: 3, icon: Icons.person), 
          ],
        ),
      ),
    );
  }
}


class CalendarWidget extends StatefulWidget {
  final int currentMonth;
  final int currentYear;
  final Function(int) onMonthChanged;
  final Function(int) onYearChanged;

  const CalendarWidget({
    Key? key,
    required this.currentMonth,
    required this.currentYear,
    required this.onMonthChanged,
    required this.onYearChanged,
  }) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF282F38), // Darker card color
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<int>(
                  value: widget.currentMonth,
                  dropdownColor: const Color(0xFF303841),
                  onChanged: (int? newValue) {
                    if (newValue != null) {
                      widget.onMonthChanged(newValue);
                    }
                  },
                  items: List.generate(12, (index) {
                    return DropdownMenuItem<int>(
                      value: index + 1,
                      child: Text(DateFormat('MMMM').format(DateTime(widget.currentYear, index + 1)), style: const TextStyle(color: Colors.white)),
                    );
                  }),
                ),
                DropdownButton<int>(
                  value: widget.currentYear,
                  dropdownColor: const Color(0xFF303841),
                  onChanged: (int? newValue) {
                    if (newValue != null) {
                      widget.onYearChanged(newValue);
                    }
                  },
                  items: List.generate(5, (index) { // Generate for 5 years
                    return DropdownMenuItem<int>(
                      value: widget.currentYear - 2 + index, // 2 years back, current, 2 years forward
                      child: Text((widget.currentYear - 2 + index).toString(), style: const TextStyle(color: Colors.white)),
                    );
                  }),
                ),
              ],
            ),
            // Add your calendar UI here. Consider using a package like table_calendar.
          ],
        ),
      ),
    );
  }
}



class EventWidget extends StatelessWidget {
  final String title;
  final int count;
  final IconData icon; // Add icon parameter

  const EventWidget({required this.title, required this.count, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF282F38), // Darker card color
      child: ListTile(
        leading: Icon(icon, color: Colors.white), // Display the icon
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: Text("$count", style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}