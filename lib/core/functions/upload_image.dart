import 'dart:io';

import 'package:dio/dio.dart';

Future<String> uploadImage(File image) async {
  const cloudName = 'o4xihtao';
  const uploadPreset = 'bvlaal3a';

  final formData = FormData.fromMap({
    'file': await MultipartFile.fromFile(
      image.path,
      filename: image.path.split('/').last,
    ),
    'upload_preset': uploadPreset,
  });

  final response = await Dio().post(
    'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
    data: formData,
  );

  return response.data['secure_url'] as String;
}
