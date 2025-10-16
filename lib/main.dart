import 'package:flutter/material.dart';
import 'package:imagepicker/providers/image_provider.dart';
import 'package:imagepicker/screens/imagepicker.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ImageState()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ImagePickerApp(),
    );
  }
}
