import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import 'text_field_decoration.dart';

class ApiKeyWidget extends StatelessWidget {
  ApiKeyWidget({
    super.key,
    required this.onSubmitted,
    required this.title,
  });

  final String title;
  final ValueChanged onSubmitted;
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'To use the Gemini API, you\'ll need an API key. '
                'If you don\'t already have one, '
                'create a key in Google AI Studio.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Link(
                uri: Uri.https('aistudio.google.com', '/app/apikey'),
                target: LinkTarget.blank,
                builder: (context, followLink) => TextButton(
                  onPressed: followLink,
                  child: const Text('Get an API Key'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: textFieldDecoration(context, 'Enter your API key'),
                controller: _textController,
                obscureText: true,
                onSubmitted: (value) {
                  onSubmitted(value);
                },
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                onSubmitted(_textController.value.text);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}