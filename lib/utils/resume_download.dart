import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'resume_download_stub.dart'
    if (dart.library.io) 'resume_download_io.dart'
    if (dart.library.html) 'resume_download_web.dart';

const String kResumeAssetPath = 'assets/resume/resume.pdf';

/// Loads bundled PDF and opens it (native) or triggers download (web).
Future<void> openBundledResume(BuildContext? context) async {
  try {
    final data = await rootBundle.load(kResumeAssetPath);
    final bytes = data.buffer.asUint8List();
    await openBundledResumeBytes(bytes);
  } catch (e) {
    if (context != null && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Could not open resume. Add your PDF at assets/resume/resume.pdf',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      );
    }
  }
}
