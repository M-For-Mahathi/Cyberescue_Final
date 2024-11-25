import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import dotenv
import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatbotService {
  static String apiKey = dotenv.env[
      'sk-CeLwoYMKHnZtPZYQqoTsqeDMkMv8qeexCybdXgSJEzFo1OArmZrhV2UNa3y1sLy7-EgTn44v6oT3BlbkFJ5IR8ZQ0my14_Cz6Dykez2UDOhjcWBvvrX1MBZm0Y6DURwTGIX-tRbCfMneUglrkOyCuYprO9wA']!; // Use API key from .env file

  Future<String> getChatbotResponse(String userMessage) async {
    String prompt =
        "I am a cyberbullying assistant. I can help you identify if you are experiencing cyberbullying. "
        "Please tell me what's happening, and I will give advice on what to do.";

    if (userMessage.contains("cyberbullying")) {
      prompt =
          "I'm sorry to hear that you're dealing with cyberbullying. Can you tell me more details?";
    }

    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/completions'),
        headers: {
          'Authorization':
              'Bearer sk-CeLwoYMKHnZtPZYQqoTsqeDMkMv8qeexCybdXgSJEzFo1OArmZrhV2UNa3y1sLy7-EgTn44v6oT3BlbkFJ5IR8ZQ0my14_Cz6Dykez2UDOhjcWBvvrX1MBZm0Y6DURwTGIX-tRbCfMneUglrkOyCuYprO9wA', // Use the API key from .env file
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "model": "text-davinci-003", // Model to use
          "prompt": prompt + " " + userMessage,
          "temperature": 0.7,
          "max_tokens": 150,
        }),
      );

      // Print the response for debugging
      print("API Response Status: ${response.statusCode}");
      print("API Response Body: ${response.body}");

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        return data['choices'][0]['text'].trim();
      } else {
        return 'Sorry, I am having trouble processing your request.';
      }
    } catch (e) {
      // Catch any errors during the API call
      print('Error during API request: $e');
      return 'Sorry, I am having trouble processing your request.';
    }
  }
}
