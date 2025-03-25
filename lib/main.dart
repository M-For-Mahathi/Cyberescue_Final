import 'package:cyberescue/screens/common_attacks_screen.dart';
import 'package:cyberescue/screens/request_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import dotenv
import 'services/notification_service.dart'; // Import NotificationService
import 'screens/chat_screen.dart'; // Import ChatScreen for the AI-powered chatbot
import 'screens/main_screen.dart'; // Import MainScreen from screens
// Import RequestScreen
// Import CommonCyberAttacksScreen

void main() async {
  // Ensure proper initialization
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Load environment variables from the .env file
    await dotenv.load(); // Load environment variables
    print("Environment variables loaded successfully");
  } catch (e) {
    print("Error loading environment variables: $e");
  }

  // Initialize the NotificationService when the app starts
  NotificationService().initializeNotifications(); // Initialize notifications

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Schedule a daily periodic notification for Cyber Safety tips (Optional)
    NotificationService().schedulePeriodicNotification(
      id: 0,
      title: 'Cyber Safety Tip',
      body: 'Don’t share sensitive information over unsecured platforms.',
      interval: Duration(hours: 24), // Adjust interval as needed
    );

    return MaterialApp(
      title: 'Cyberescue',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(), // Set HomeScreen as the first screen
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome to Cyberescue')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Cyberescue',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Your online cyber friend',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 50),
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the account screen when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountsScreen()),
                );
              },
              child: Text('Go to Account Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background color or gradient
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Judiciary account (circular with shadow)
              _buildCircleAvatar('Judiciary', Colors.blue),
              SizedBox(height: 20),

              // Lawyer account (circular with shadow)
              _buildCircleAvatar('Lawyer', Colors.green),
              SizedBox(height: 20),

              // Client account (button inside circle with shadow)
              _buildClientButton(context), // Pass context for navigation
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create a circular avatar
  Widget _buildCircleAvatar(String title, Color color) {
    return CircleAvatar(
      radius: 60, // Increased size for more emphasis
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

  // Helper method to create a circular button
  Widget _buildClientButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // After pressing the "Client" button, navigate to both screens
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RequestPage(userType: 'client')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CommonAttacksScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(60), // Larger padding for bigger button
        backgroundColor: Colors.orange,
        elevation: 10, // Shadow effect for elevation
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
