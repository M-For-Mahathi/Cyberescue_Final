import 'package:flutter/material.dart';

class CommonAttacksScreen extends StatefulWidget {
  @override
  _CommonAttacksScreenState createState() => _CommonAttacksScreenState();
}

class _CommonAttacksScreenState extends State<CommonAttacksScreen> {
  final Map<String, Map<String, String>> _attacks = {
    'Phishing Attack': {
      'description': 'Phishing involves sending fraudulent emails or messages to trick individuals into sharing sensitive information like passwords or credit card details.',
      'legalActions': 'Phishing is punishable under Section 66D of the IT Act, 2000, for impersonation. Violators can face imprisonment of up to 3 years and/or a fine.',
      'steps': '1. Avoid clicking on suspicious links in emails or messages.\n2. Report phishing attempts to your email provider.\n3. File a complaint at your local cybercrime office.',
    },
    'Social Engineering Attack': {
      'description': 'Social engineering manipulates individuals into divulging confidential information, often by pretending to be a trustworthy entity.',
      'legalActions': 'Social engineering tactics may violate Section 66C and Section 66D of the IT Act for identity theft and impersonation. Complaints can be lodged with the Cyber Crime Cell.',
      'steps': '1. Verify requests for personal information independently.\n2. Educate yourself about common social engineering tactics.\n3. Report incidents to the concerned authorities.',
    },
    'Ransomware Attack': {
      'description': 'Ransomware is a malicious software that locks your data and demands payment for its release.',
      'legalActions': 'Ransomware attacks are punishable under Section 43 and Section 66 of the IT Act, 2000. It is also categorized as extortion under Section 384 of the Indian Penal Code.',
      'steps': '1. Disconnect your device from the internet immediately.\n2. Do not pay the ransom as it encourages more attacks.\n3. Contact cybersecurity experts and report the incident to cybercrime authorities.',
    },
    'Spoofing': {
      'description': 'Spoofing involves disguising communication (email, calls, etc.) to appear as though it’s coming from a trusted source.',
      'legalActions': 'Spoofing is covered under Section 66C of the IT Act, which penalizes identity theft. Violators can face up to 3 years of imprisonment and/or a fine.',
      'steps': '1. Use secure and verified communication channels.\n2. Avoid sharing sensitive information unless sure of the source.\n3. Report the incident to the relevant authorities.',
    },
    'SIM Card Swapping Attack': {
      'description': 'SIM swapping allows attackers to take control of your phone number to intercept calls and messages, often to access financial accounts.',
      'legalActions': 'Such attacks fall under Sections 66C and 66D of the IT Act for identity theft and impersonation. Complaints can also be filed under banking fraud laws.',
      'steps': '1. Contact your mobile service provider to lock your SIM.\n2. Inform your bank to secure your accounts.\n3. File a cybercrime report immediately.',
    },
    'Vishing Attack': {
      'description': 'Vishing (voice phishing) uses phone calls to trick victims into revealing personal and financial details.',
      'legalActions': 'Vishing is penalized under Section 66D of the IT Act for impersonation and cheating. You can file a complaint with your telecom service provider or cybercrime portal.',
      'steps': '1. Do not disclose sensitive details over phone calls.\n2. Verify the caller’s identity before responding.\n3. Report suspicious calls to your service provider and authorities.',
    },
    'Password Attack': {
      'description': 'Password attacks aim to gain unauthorized access to accounts by cracking or stealing passwords.',
      'legalActions': 'Password theft is punishable under Section 43 and Section 66 of the IT Act, 2000, for unauthorized access and data theft.',
      'steps': '1. Change your password immediately if compromised.\n2. Enable two-factor authentication for added security.\n3. Report unauthorized access to the service provider and cybercrime authorities.',
    },
    'Cyber Bullying': {
      'description': 'Cyberbullying involves using digital platforms like social media or messaging apps to harass or harm someone emotionally or mentally.',
      'legalActions': 'Cyberbullying is punishable under Section 67 of the IT Act, which prohibits publishing offensive content online. It can also be addressed under IPC Sections 507 (criminal intimidation) and 509 (outraging modesty).',
      'steps': '1. Block and report the bully on the platform.\n2. Take screenshots as evidence.\n3. File a complaint with the Cyber Crime Cell or at https://cybercrime.gov.in/.',
    },
  };

  String? _selectedAttack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Common Attacks'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select an Attack Type:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(height: 15),
            DropdownButton<String>(
              value: _selectedAttack,
              hint: Text('Select an Attack', style: TextStyle(color: Colors.green)),
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedAttack = newValue;
                });
              },
              items: _attacks.keys.map<DropdownMenuItem<String>>((String attack) {
                return DropdownMenuItem<String>(
                  value: attack,
                  child: Text(attack, style: TextStyle(color: Colors.green)),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            if (_selectedAttack != null)
              Expanded(
                child: SingleChildScrollView(
                  child: Card(
                    color: Colors.green.shade50,
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Attack Information:',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                          ),
                          SizedBox(height: 10),
                          Text(
                            _attacks[_selectedAttack]!['description']!,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Legal Actions:',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                          ),
                          SizedBox(height: 10),
                          Text(
                            _attacks[_selectedAttack]!['legalActions']!,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Steps to Follow:',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                          ),
                          SizedBox(height: 10),
                          Text(
                            _attacks[_selectedAttack]!['steps']!,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
