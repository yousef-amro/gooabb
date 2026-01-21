import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openSupportEmail(BuildContext context) async {
  const supportEmail = 'support@gooabb.com';

  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: supportEmail,
    queryParameters: {'subject': 'Support request'},
  );

  try {
    final ok = await launchUrl(
      emailUri,
      mode: LaunchMode.externalApplication,
    );

    if (!ok) {
      await Clipboard.setData(
        const ClipboardData(text: supportEmail),
      );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'No email app configured. We copied support@gooabb.com to your clipboard.',
            ),
          ),
        );
      }
    }
  } catch (_) {
    await Clipboard.setData(const ClipboardData(text: supportEmail));
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Couldn’t open email app. We copied support@gooabb.com to your clipboard.',
          ),
        ),
      );
    }
  }
}
