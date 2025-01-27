import "package:flutter/material.dart";

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.red),
            accountName: const Text(
              'Gmail',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            accountEmail: Text(
              'fabiomunez5@gmail.com',
              style: TextStyle(
                color: Colors.grey[100],
                fontSize: 14,
              ),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile.jpg"),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.inbox),
            title: const Text('Primary'),
            selected: true,
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Social'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.local_offer),
            title: const Text('Promotions'),
            onTap: () => Navigator.pop(context),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Starred'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.access_time),
            title: const Text('Snoozed'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.send),
            title: const Text('Sent'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.drafts),
            title: const Text('Drafts'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
