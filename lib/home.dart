import 'package:flutter/material.dart';
import 'sidebar.dart';
import 'dashboard_content.dart';
import 'right_panel.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(flex: 2, child: SidebarMenu()),
          Expanded(flex: 7, child: DashboardContent()),
          Expanded(flex: 3, child: RightPanel()),
        ],
      ),
    );
  }
}
