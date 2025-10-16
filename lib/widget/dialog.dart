import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

void showInfoDialog(BuildContext context,
    {String title = 'Izinkan mengakses galeri',
    String desc = 'buka pengaturan untuk mengaktifkan izin',
    VoidCallback? onOk,
    VoidCallback? onCancel}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.info,
    animType: AnimType.rightSlide,
    title: title,
    desc: desc,
    btnCancelOnPress: onCancel,
    btnOkOnPress: onOk,
  ).show();
}
