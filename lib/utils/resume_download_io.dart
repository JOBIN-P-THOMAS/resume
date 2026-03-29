import 'dart:io';
import 'dart:typed_data';

import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

Future<void> openBundledResumeBytes(Uint8List bytes) async {
  final dir = await getTemporaryDirectory();
  final file = File('${dir.path}/Jobin_P_Thomas_Resume.pdf');
  await file.writeAsBytes(bytes, flush: true);
  await OpenFilex.open(file.path);
}
