import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:imagepicker/widget/dialog.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHalper {
  static Future<bool> requestPermission(
      BuildContext context, Permission permission) async {
    var status = await permission.status;

    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      final result = await permission.request();

      if (result.isGranted) return true;

      if (result.isPermanentlyDenied) {
        if (context.mounted) _showPermissionDialog(context, permission);
      }
    } else if (status.isPermanentlyDenied) {
      if (context.mounted) _showPermissionDialog(context, permission);
    }

    return false;
  }

  static void _showPermissionDialog(
      BuildContext context, Permission permission) {
    showInfoDialog(
      context,
      title: 'Izin Ditolak',
      desc:
          "Izin untuk ${_permissionname(permission)} ditolak.\n\nSilakan buka pengaturan untuk mengaktifkan izin.",
      onOk: () {
        Future.delayed(const Duration(milliseconds: 500), () {
          AppSettings.openAppSettings();
        });
      },
    );
  }

  static String _permissionname(Permission permission) {
    switch (permission) {
      case Permission.camera:
        return "kamera";
      case Permission.photos:
        return "foto";
      case Permission.storage:
        return "penyimpanan";
      default:
        return "";
    }
  }
}
