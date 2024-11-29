import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            NotificationCard(
              title: "Spoken English",
              subtitle: "You have a new assignment in my Class. Please complete it within tomorrow (12/08/2024).",
              time: "3 min ago",
            ),
            NotificationCard(
              title: "Live Session for 12/07/2024 Class",
              subtitle: "Today we are going to see about the verbs and adverb in this session join the session sharply at 5pm.",
              time: "10 min ago",
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;

  NotificationCard({
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person, color: Colors.grey),
              SizedBox(width: 8),
              Text(
                'INSTRUCTOR',
                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                time,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(color: Colors.black87),
          ),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Go to page ➔',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
