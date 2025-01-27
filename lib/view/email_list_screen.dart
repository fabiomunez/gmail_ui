import "package:flutter/material.dart";
import "package:gmail_ui/view/email_list_item.dart";


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
void _onEmailTap(BuildContext context, Map<String, String> email) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => EmailDetailScreen(email: email),
    ),
  );
}

class EmailDetailScreen extends StatelessWidget {
  final Map<String, String> email;

  const EmailDetailScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(email['subject'] ?? 'Email Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              email['sender'] ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              email['time'] ?? '',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Text(
              email['preview'] ?? '',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

// Removed duplicate build method