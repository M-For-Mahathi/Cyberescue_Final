import 'package:flutter/material.dart';
import 'request_page.dart';  // Import RequestPage
import 'common_attacks_screen.dart';  // Import CommonAttacksScreen

class ClientOptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Client Options')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to RequestPage and replace current screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RequestPage()),
                );
              },
              child: Text('Go to Request Page'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to CommonAttacksScreen and replace current screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => CommonAttacksScreen()),
                );
              },
              child: Text('Go to Common Attacks'),
            ),
          ],
        ),
      ),
    );
  }
}
