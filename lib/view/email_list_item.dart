import "package:flutter/material.dart";

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
