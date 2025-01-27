import 'package:flutter/material.dart';

void main() {
  runApp(const GmailCloneApp());
}

class GmailCloneApp extends StatelessWidget {
  const GmailCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light,
      ),
      home: const HomeScreen(),
    );
  }
}

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


class EmailList extends StatelessWidget {
  const EmailList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> emails = [
      {
        'sender': 'LinkedIn',
        'subject': 'New job opportunities for you',
        'preview': 'Based on your profile, we found these job matches...',
        'time': '11:23 AM',
        'avatar': 'L',
      },
      {
        'sender': 'Amazon',
        'subject': 'Your order has been shipped!',
        'preview': 'Track your package or view order details...',
        'time': '10:15 AM',
        'avatar': 'A',
      },
      {
        'sender': 'Netflix',
        'subject': 'New on Netflix: Shows you might like',
        'preview': 'Check out the latest additions to our catalog...',
        'time': '9:45 AM',
        'avatar': 'N',
      },
      {
        'sender': 'GitHub',
        'subject': 'Security alert for your repository',
        'preview': 'We found a potential security vulnerability...',
        'time': '8:30 AM',
        'avatar': 'G',
      },
      {
        'sender': 'Spotify',
        'subject': 'Your weekly mixtape is ready',
        'preview': 'Discover new songs based on your listening history...',
        'time': 'Yesterday',
        'avatar': 'S',
      },
    ];

    return ListView.builder(
      itemCount: emails.length,
      itemBuilder: (context, index) {
        return EmailListItem(emailData: emails[index]);
      },
    );
  }
}

class EmailListItem extends StatefulWidget {
  final Map<String, String> emailData;

  const EmailListItem({super.key, required this.emailData});

  @override
  State<EmailListItem> createState() => _EmailListItemState();
}

class _EmailListItemState extends State<EmailListItem> {
  bool isStarred = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        child: Text(widget.emailData['avatar']!),
      ),
      title: Row(
        children: [
          Expanded(child: Text(widget.emailData['sender']!)),
          Text(
            widget.emailData['time']!,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.emailData['subject']!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            widget.emailData['preview']!,
            style: TextStyle(color: Colors.grey[600]),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          isStarred ? Icons.star : Icons.star_border,
          color: isStarred ? Colors.yellow[700] : Colors.grey,
        ),
        onPressed: () {
          setState(() {
            isStarred = !isStarred;
          });
        },
      ),
      isThreeLine: true,
      onTap: () {},
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.red),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Gmail',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'fabiomunez5@gmail.com',
                  style: TextStyle(
                    color: Colors.grey[100],
                    fontSize: 14,
                  ),
                ),
              ],
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

class ComposeScreen extends StatefulWidget {
  const ComposeScreen({super.key});

  @override
  State<ComposeScreen> createState() => _ComposeScreenState();
}

class _ComposeScreenState extends State<ComposeScreen> {
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  void dispose() {
    _toController.dispose();
    _subjectController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Compose',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.attachment, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.grey),
            onPressed: () {
              // Here you would typically implement send functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Email sent!')),
              );
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ComposeTextField(
              controller: _toController,
              hint: 'To',
              showDivider: true,
            ),
            ComposeTextField(
              controller: _subjectController,
              hint: 'Subject',
              showDivider: true,
            ),
            ComposeTextField(
              controller: _bodyController,
              hint: 'Compose email',
              maxLines: null,
              showDivider: false,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.format_bold),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.format_italic),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.format_underline),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.format_list_bulleted),
              onPressed: () {},
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ComposeTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool showDivider;
  final int? maxLines;

  const ComposeTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.showDivider,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            border: InputBorder.none,
          ),
        ),
        if (showDivider) const Divider(height: 1),
      ],
    );
  }
}