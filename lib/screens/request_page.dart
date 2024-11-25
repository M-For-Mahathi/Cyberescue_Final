import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  final TextEditingController _issueController = TextEditingController();
  String? _selectedCategory;
  String? _filePath;
  final List<String> _categories = [
    'Legal Issue',
    'Technical Issue',
    'General Inquiry'
  ];

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'pdf'],
    );

    if (result != null) {
      setState(() {
        _filePath = result.files.single.path;
      });
    } else {
      print("No file selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Request', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Describe Your Issue:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _issueController,
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type your issue here...',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Select Category:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: _selectedCategory,
              hint: Text('Select Category'),
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue;
                });
              },
              items: _categories.map<DropdownMenuItem<String>>((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickFile,
              child: Text('Upload PNG or PDF', style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
            if (_filePath != null) ...[
              SizedBox(height: 10),
              Text('File selected: $_filePath'),
            ],
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  print('Issue: ${_issueController.text}');
                  print('Category: $_selectedCategory');
                  print('File Path: $_filePath');
                },
                child: Text('Submit Request', style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
