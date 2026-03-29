import 'dart:typed_data';

/// Non-web, non-IO platforms (should not occur in Flutter app).
Future<void> openBundledResumeBytes(Uint8List bytes) async {
  throw UnsupportedError('Resume download not supported on this platform.');
}
