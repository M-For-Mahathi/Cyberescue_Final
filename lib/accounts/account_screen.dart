import 'package:flutter/material.dart';
import '../screens/client_options_screen.dart';
import '../screens/request_page.dart';
import '../screens/common_attacks_screen.dart';
import '../screens/contact_lawyers_screen.dart';
import '../screens/faqs_screens.dart';
import '../screens/chat_screen.dart';

class AccountsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accounts'),
        actions: [
          IconButton(
            icon: Icon(Icons.question_answer),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FaqsScreen()),
              );
            },
            tooltip: 'FAQs',
          ),
          SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.contact_mail),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactLawyersScreen()),
              );
            },
            tooltip: 'Contact Lawyers',
          ),
          SizedBox(width: 10),
          // IconButton(
          //   icon: Icon(Icons.security),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => CommonAttacksScreen()),
          //     );
          //   },
          //   tooltip: 'Common Attacks',
          // ),
          SizedBox(width: 10),
          // IconButton(
          //   icon: Icon(Icons.file_copy),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => RequestPage()),
          //     );
          //   },
          //   tooltip: 'Request Page',
          // ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildCircleAvatar('Judiciary', Colors.blue),
                  SizedBox(height: 20),
                  _buildCircleAvatar('Lawyer', Colors.green),
                  SizedBox(height: 20),
                  _buildClientButton(context),
                ],
              ),
            ),

            // Chatbot navigation box on the right side
            Positioned(
              bottom: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatScreen()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.chat, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Cyberbullying Chatbot',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleAvatar(String title, Color color) {
    return CircleAvatar(
      radius: 60,
      backgroundColor: color,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  Widget _buildClientButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ClientOptionsScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(60),
        backgroundColor: Colors.orange,
        elevation: 10,
      ),
      child: Text(
        'Client',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
