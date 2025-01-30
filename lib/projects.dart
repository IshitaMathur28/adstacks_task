import 'package:flutter/material.dart';

class ProjectTable extends StatelessWidget {
  final List<Map<String, String>> projects = [
    {"name": "Adstacks Admin", "status": "Completed", "date": "Oct 20, 2023"},
    {"name": "Adstacks Website", "status": "In Progress", "date": "Nov 15, 2023"},
    {"name": "Mobile App Design", "status": "Pending", "date": "Dec 5, 2023"},
   
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color:const Color.fromARGB(255, 46, 63, 91), 
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("All Projects",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            DataTable(
              columnSpacing: 16, 
              headingRowColor: MaterialStateProperty.all(
                  const Color(0xFF303841)), 
              columns: [
                DataColumn(
                  label: Text("Name",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                DataColumn(
                  label: Text("Status",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                DataColumn(
                  label: Text("Date",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ],
              rows: projects.map((project) {
                return DataRow(
                  cells: [
                    DataCell(Text(project["name"]!,
                        style: const TextStyle(color: Colors.white))),
                    DataCell(Text(project["status"]!,
                        style: const TextStyle(color: Colors.white))),
                    DataCell(Text(project["date"]!,
                        style: const TextStyle(color: Colors.white))),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}