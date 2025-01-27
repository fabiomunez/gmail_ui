import "package:flutter/material.dart";


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