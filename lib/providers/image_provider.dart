
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imagepicker/core/utils/permission_halper.dart';
import 'package:imagepicker/models/image_model.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageState with ChangeNotifier {
  final ImagePicker _picker = ImagePicker();
  ImageModel? _image;
  String? _error;

  ImageModel? get image => _image;
  String? get error => _error;

  Future<void> pickImageFromGallery(BuildContext context) async {
    await _pickImage(context, ImageSource.gallery, Permission.storage);
  }

  Future<void> _pickImage(BuildContext context, ImageSource source, Permission permission) async {
    try {
      _error = null;
      final granted = await PermissionHalper.requestPermission(context, permission);

      if (!granted) return;

      final file = await _picker.pickImage(source: source, imageQuality: 80);

      if (file == null) {
        _error = "Tidak ada gambar yang dipilih";
      } else {
        _image = ImageModel(file.path);
      }
    } on Exception catch (e) {
      _error = e.toString();
    } catch (e) {
      _error = e.toString();
    } finally {
      notifyListeners();
    }
  }
}