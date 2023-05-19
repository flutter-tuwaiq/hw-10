import 'dart:io';

class BaseEnv {
  static final ip = InternetAddress.anyIPv4;
  static final port = int.parse(Platform.environment['PORT'] ?? '8080');
}
