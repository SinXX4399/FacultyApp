import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Faculty User'),
            accountEmail: Text('faculty@example.com'),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pop(context);
              // Navigator.pushNamed(context, '/dashboard');
            },
          ),

          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Students'),
            onTap: () {
              Navigator.pop(context);
              // Navigator.pushNamed(context, '/students');
            },
          ),

          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Lecturers'),
            onTap: () {
              Navigator.pop(context);
              // Navigator.pushNamed(context, '/lecturers');
            },
          ),

          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Courses'),
            onTap: () {
              Navigator.pop(context);
              // Navigator.pushNamed(context, '/courses');
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              // Navigator.pushNamed(context, '/settings');
            },
          ),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);

              // Add logout logic here
            },
          ),
        ],
      ),
    );
  }
}