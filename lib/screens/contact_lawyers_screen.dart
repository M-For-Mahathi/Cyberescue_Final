import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactLawyersScreen extends StatelessWidget {
  // List of demo lawyers
  final List<Map<String, String>> lawyers = [
    {'name': 'John Doe', 'contact': '1234567890', 'email': 'john@example.com'},
    {'name': 'Jane Smith', 'contact': '0987654321', 'email': 'jane@example.com'},
  ];

  // Method to initiate a call
  void _makeCall(String number) async {
    final Uri url = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Method to send an email
  void _sendEmail(String email) async {
    final Uri url = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Lawyers', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: lawyers.length,
          itemBuilder: (context, index) {
            final lawyer = lawyers[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(
                  lawyer['name']!,
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                ),
                subtitle: Text('Contact: ${lawyer['contact']}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.phone, color: Colors.green),
                      onPressed: () => _makeCall(lawyer['contact']!),
                    ),
                    IconButton(
                      icon: Icon(Icons.email, color: Colors.green),
                      onPressed: () => _sendEmail(lawyer['email']!),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
