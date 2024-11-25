import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // For persistent storage
import 'package:cyberescue/accounts/account_screen.dart'; // Import AccountsScreen

class PersonalInfoScreen extends StatefulWidget {
  final String name;
  final String email;
  final String phone;

  PersonalInfoScreen({required this.name, required this.email, required this.phone});

  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final _addressController = TextEditingController();
  final _aadharController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Info'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Address field
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // Aadhar field
              TextFormField(
                controller: _aadharController,
                decoration: InputDecoration(
                  labelText: 'Aadhar Number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Aadhar number';
                  }
                  // You could add more complex validation for Aadhar, like length check
                  if (value.length != 12) {
                    return 'Aadhar number must be 12 digits long';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // Save Info Button
              ElevatedButton(
                onPressed: _saveInfo,
                child: Text('Save Info', style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveInfo() async {
    if (_formKey.currentState!.validate()) {
      // Save the entered info
      final address = _addressController.text;
      final aadhar = _aadharController.text;

      // Simulating saving data, you could save it to SharedPreferences, Firebase, etc.
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('address', address);
      prefs.setString('aadhar', aadhar);

      // Navigate to the Account Screen after saving info
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AccountsScreen()),
      );
    }
  }
}
