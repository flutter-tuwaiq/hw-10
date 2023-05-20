// ignore_for_file: file_names

import 'dart:io';

class BaseEnv {
    final ip = 'localhost';
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
}