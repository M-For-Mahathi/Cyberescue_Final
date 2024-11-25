import 'package:flutter/material.dart';

class FaqsScreen extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      'question': 'What is Cyberescue?',
      'answer': 'Cyberescue is an app that helps victims of cybercrime connect with legal experts, and provide insights about the relief law offers them.'
    },
    {
      'question': 'Features of the app?',
      'answer': "Secure Authentication, Chatbot for cyberbullying issues are some of Cyberescue's key Features. Fret not! Yout information is safe with us!"
    },
    {
      'question': 'When should I use the app?',
      'answer': 'Use Cyberescue when you are a victim of cybercrime or need assistance in addressing a cyber-related issue.'
    },
    {
      'question': 'What are the necessary disclaimers?',
      'answer': 'Cyberescue is a connecting platform and does not provide legal advice directly. Always verify credentials before engaging with listed contacts.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: faqs.length,
          itemBuilder: (context, index) {
            final faq = faqs[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ExpansionTile(
                title: Text(
                  faq['question']!,
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(faq['answer']!),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
