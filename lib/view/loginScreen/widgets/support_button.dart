import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openSupportEmail() async {
  final Uri uri = Uri(
    scheme: 'mailto',
    path: 'support@gooabb.com',
    queryParameters: {
      'subject': 'Support Request',
      'body': 'Hello Support,\n\n',
    },
  );

  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not open email app');
  }
}

class SupportButton extends StatelessWidget {
  const SupportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: openSupportEmail,
      child: const Text('تواصل مع الدعم'),
    );
  }
}
