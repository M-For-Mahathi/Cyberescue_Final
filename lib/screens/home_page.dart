import 'package:flutter/material.dart';
import '../accounts/account_screen.dart'; // Import the AccountsScreen
import 'chat_screen.dart'; // Import ChatScreen for the AI-powered chatbot

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cyberescue')),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center the content vertically
          crossAxisAlignment:
              CrossAxisAlignment.center, // Center the content horizontally
          children: <Widget>[
            // Welcome text with subtitle
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to Cyberescue',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10), // Space between main title and subtitle
                Text(
                  'Your online cyber friend',
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),

            // Add spacing between the text and buttons
            SizedBox(height: 50),

            // First button: Start Chat with Cyberbullying Assistant
            ElevatedButton(
              onPressed: () {
                // Navigate to the chat screen when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
              child: Text('Start Chat with Cyberbullying Assistant'),
            ),
            SizedBox(height: 20), // Space between buttons

            // Second button: Go to Account Section
            ElevatedButton(
              onPressed: () {
                // Navigate to the account screen (if needed)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountsScreen()),
                );
              },
              child: Text('Go to Account Section'),
            ),
          ],
        ),
      ),
    );
  }
}
