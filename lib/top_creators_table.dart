import 'package:flutter/material.dart';

class TopCreatorsTable extends StatelessWidget {
  final List<Map<String, String>> creators = [
    {"name": "@maddison_c21", "artworks": "9821", "rating": ""}, // Empty rating for now
    {"name": "@karlwil02", "artworks": "7032", "rating": ""},
    {"name": "@maddison_c21", "artworks": "9821", "rating": ""},
    {"name": "@maddison_c21", "artworks": "9821", "rating": ""},
    // Add more creator data here
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color:const Color.fromARGB(255, 46, 63, 91), // Dark blue background for the card
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
          children: [
            const Text("Top Creators",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            DataTable(
              columnSpacing: 16, // Add spacing between columns
              headingRowColor: MaterialStateProperty.all(
                  const Color(0xFF303841)), // Slightly darker for header row
              columns: [
                DataColumn(
                  label: Text("Name",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                DataColumn(
                  label: Text("Artworks",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                DataColumn(
                  label: Text("Rating",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ],
              rows: creators.map((creator) {
                return DataRow(
                  cells: [
                    DataCell(Row(
                      children: [
                        const Icon(Icons.person,
                            color: Colors.white), // Person icon
                        const SizedBox(width: 8),
                        Text(creator["name"]!,
                            style: const TextStyle(color: Colors.white)),
                      ],
                    )),
                    DataCell(Text(creator["artworks"]!,
                        style: const TextStyle(color: Colors.white))),
                    DataCell(Container(
                      width: 50, // Adjust width for the colored box
                      height: 10,
                      decoration: BoxDecoration(
                        color: const Color(0xFF7C8288), // Example color for the box
                        borderRadius: BorderRadius.circular(2), // Rounded corners
                      ),
                    )),
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