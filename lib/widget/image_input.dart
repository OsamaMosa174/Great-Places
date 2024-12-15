import 'dart:io';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInputWidget extends StatefulWidget {
  final Function onselectImage;

  const ImageInputWidget(this.onselectImage, {super.key});

  @override
  State<ImageInputWidget> createState() => _ImageInputWidgetState();
}

class _ImageInputWidgetState extends State<ImageInputWidget> {
  File? _storedImage;

  Future<void> _takePicture() async {
    final imageFile = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxWidth: 600);

    if (imageFile == null) {
      return;
    }
    final File imageAsFile = File(imageFile.path);
    setState(() {
      _storedImage = File(imageFile.path);
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(imageFile.path);
    final saveimage = await imageAsFile.copy('${appDir.path}/$filename');
    widget.onselectImage(saveimage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 150,
          decoration:
              BoxDecoration(border: Border.all(width: 1), color: Colors.grey),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text(
                  'No Image Taken',
                  textAlign: TextAlign.center,
                ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: _takePicture,
            label: Text(
              'Take Picture',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            icon: const Icon(Icons.camera),
          ),
        ),
      ],
    );
  }
}
