import 'package:flutter/material.dart';
import 'top_creators_table.dart';
import 'package:adstacks_1/dashboard_chart.dart';
import 'projects.dart';

class DashboardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20), // Add const for consistency
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("HOME", // Add const
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              // You can add something on the right if needed
            ],
          ),
          const SizedBox(height: 20), // Add const

          // Top Rating Project (Consider extracting to a separate widget)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Top Rating Project", // Add const
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const Text( // Add const
                    "Trending project and high rating Project Created by team",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 10), // Add const
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Learn More")), // Add const
                ],
              ),
            ),
          ),

          const SizedBox(height: 20), // Add const

          // Projects and Top Creators (Use Expanded within a Row)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: ProjectTable()),
              const SizedBox(width: 20), // Add spacing
              Expanded(child: TopCreatorsTable()),
            ],
          ),

          const SizedBox(height: 20), // Add const

          // Over All Performance (Chart)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Over All Performance", // Add const
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10), // Add const
                  SizedBox( // Add a SizedBox to constrain the chart's height
                    height: 300, // Set a reasonable height for the chart
                    child: DashboardChart(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}