import 'dart:math';

import 'package:image_picker/image_picker.dart';

Future<String> pickImage({ImageSource? source}) async {
  final picker = ImagePicker();

  String path = '';

  try {
    final pickedFile = await picker.getImage(source: source!);

    if (pickedFile != null) {
      path = pickedFile.path;
    } else {
      path = '';
    }
  } catch (e) {
    print(e);
  }
  return path;
}
