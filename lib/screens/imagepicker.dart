import 'dart:io';

import 'package:flutter/material.dart';
import 'package:imagepicker/providers/image_provider.dart';
import 'package:provider/provider.dart';

class ImagePickerApp extends StatefulWidget {
  const ImagePickerApp({super.key});

  @override
  State<ImagePickerApp> createState() => _ImagePickerAppState();
}

class _ImagePickerAppState extends State<ImagePickerApp> {
  @override
  Widget build(BuildContext context) {
    final imageState = context.watch<ImageState>();

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Choose Image From Gallery : ',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () => imageState.pickImageFromGallery(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: const Text(
                            'Open Gallery',
                            style: TextStyle(fontSize: 18),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'the image will appear here',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            Expanded(
                child: Center(
              child: imageState.image != null
                  ? Image.file(
                      File(imageState.image!.path),
                      fit: BoxFit.cover,
                    )
                  : imageState.error != null
                      ? Text(
                          imageState.error!,
                          style: const TextStyle(color: Colors.red),
                        )
                      : const Text('No image selected'),
            )),

            if (imageState.error != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  imageState.error!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
