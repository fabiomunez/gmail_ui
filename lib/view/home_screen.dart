import "package:gmail_ui/view/compose_screen.dart";
import "package:gmail_ui/view/drawer_screen.dart";
import "package:flutter/material.dart";
import "package:gmail_ui/view/email_list_screen.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 1,
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.deepOrange,  
                child: IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
            );
          },
        ),
        title: const Text("Inbox", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: const [
            CircleAvatar(
            backgroundImage: AssetImage("assets/images/profile.jpg"),
            ),
          SizedBox(width: 8),
        ],
      ),
      body: const EmailList(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ComposeScreen()),
          );
        },
        icon: const Icon(Icons.edit),
        label: const Text('Compose'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.red,
      ),
      drawer: const AppDrawer(),
    );
  }
}

