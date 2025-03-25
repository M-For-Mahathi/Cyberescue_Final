import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cyberescue/screens/submitted_requests.dart';

class RequestPage extends StatefulWidget {
  final String userType; // Pass user type (client/lawyer)
  const RequestPage({Key? key, required this.userType}) : super(key: key);

  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  final TextEditingController _issueController = TextEditingController();
  String? _selectedCategory;
  String? _selectedFileType;
  String? _filePath;

  final List<Map<String, String>> _submittedRequests = [];
  final List<String> _categories = ['Legal', 'Technical', 'General'];
  final List<String> _fileTypes = ['png', 'pdf', 'audio', 'video'];

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: _fileTypes,
    );

    if (result != null) {
      setState(() {
        _filePath = result.files.single.path;
      });
    }
  }

  void _submitRequest() {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedFileType != null && _filePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please attach a file for the selected file type.'),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    String requestId = 'REQ-${DateTime.now().millisecondsSinceEpoch}';

    setState(() {
      _submittedRequests.add({
        'id': requestId,
        'issue': _issueController.text,
        'category': _selectedCategory!,
        'file': _filePath ?? 'No file attached',
        'status': 'Submitted',
      });
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Request Submitted\nID: $requestId'), duration: Duration(seconds: 3)),
    );

    // Clear fields after submission
    _issueController.clear();
    setState(() {
      _selectedCategory = null;
      _selectedFileType = null;
      _filePath = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.userType != 'client') {
      return const Scaffold(
        body: Center(child: Text('Access Denied. Only clients can submit requests.')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Request', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubmittedRequests(submittedRequests: _submittedRequests),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                backgroundColor: Colors.green,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.list, color: Colors.white),
                  SizedBox(width: 5),
                  Text("Requests", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey, // Wrap everything inside a Form widget
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Describe Your Request:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextFormField(
                controller: _issueController,
                maxLines: 4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Type your request here...',
                ),
                validator: (value) => value == null || value.isEmpty ? 'Please enter your request issue' : null,
              ),
              const SizedBox(height: 20),

              // File Type Selection
              Text('Select File Type:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedFileType,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
                hint: Text('Select File Type'),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedFileType = newValue;
                  });
                },
                items: _fileTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type.toUpperCase()),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),

              // Enquiry Type Selection
              Text('Select Enquiry Type:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
                hint: Text('Select Enquiry Type'),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
                items: _categories.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                validator: (value) => value == null ? 'Please select an enquiry type' : null,
              ),
              const SizedBox(height: 20),

              // Upload File Button
              ElevatedButton(
                onPressed: _pickFile,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Upload File', style: TextStyle(color: Colors.white)),
              ),
              if (_filePath != null) ...[
                const SizedBox(height: 10),
                Text('File selected: $_filePath'),
              ],
              const SizedBox(height: 30),

              // Submit Request Button
              Center(
                child: ElevatedButton(
                  onPressed: _submitRequest,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text('Submit Request', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
