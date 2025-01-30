import 'package:flutter/material.dart';

class SidebarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 252, 252, 252),
      width: 250,
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/adstack_logo.png', height: 50),
                SizedBox(height: 10),
                Text("Adstacks", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SidebarItem(icon: Icons.home, text: "Home", route: '/'),
          SidebarItem(icon: Icons.people, text: "Employees", route: '/employees'),
          SidebarItem(icon: Icons.insights, text: "Finance", route: '/finance'),
          SidebarItem(icon: Icons.settings, text: "Setting", route: '/settings'),
          SidebarItem(icon: Icons.logout, text: "Logout", route: '/logout'),

         
          Card(
            color: Color.fromARGB(255, 252, 252, 252), 
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20), 
            child: Padding(
              padding: const EdgeInsets.all(10.0), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("WORKSPACES", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)), // Workspace heading inside the card
                  SidebarWorkspaceItem(text: "Adstacks", route: '/adstacks'),
                  SidebarWorkspaceItem(text: "Workspace 2", route: '/workspace2'),
                  
                  Text("+", style: TextStyle(fontSize: 20, color: Colors.blue)), 
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final String route;

  const SidebarItem({required this.icon, required this.text, required this.route});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       //nav
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.black, size: 20),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: TextStyle(color: Colors.black, fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SidebarWorkspaceItem extends StatelessWidget {
  final String text;
  final String route;

  const SidebarWorkspaceItem({required this.text, required this.route});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
     //nav
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20), 
        child: Text(text, style: TextStyle(color: Colors.black, fontSize: 14)), 
      ),
    );
  }
}