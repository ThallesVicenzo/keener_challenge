import 'dart:io';

enum AppImage {
  backgroundImage('background.png'),
  errorImage('error-image.jpg');

  const AppImage(this.name);

  final String name;

  String get _defaultPath => 'assets/images/';

  String get path => '$_defaultPath$name';

  File get file => File(path);
}
