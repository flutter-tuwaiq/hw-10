// Use any available host or container IP (usually `0.0.0.0`).
import 'dart:io';

class env {
  //final ip = InternetAddress.anyIPv4;

  final ip = 'localhost';

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
}
