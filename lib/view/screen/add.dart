import 'dart:io';

import 'package:flutter/material.dart';
import 'package:offline_project/provider/great_places.dart';
import 'package:offline_project/widget/image_input.dart';
import 'package:offline_project/widget/location_input.dart';
import 'package:provider/provider.dart';

class Myaddplace extends StatefulWidget {
  const Myaddplace({super.key});

  @override
  State<Myaddplace> createState() => _MyaddplaceState();
}

class _MyaddplaceState extends State<Myaddplace> {
  final _titlecontroller = TextEditingController();
  File? _pickedImage;
  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _saveplace() {
    if (_titlecontroller.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .addplace(_titlecontroller.text, _pickedImage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Place'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          TextField(
                            controller: _titlecontroller,
                            decoration:
                                const InputDecoration(labelText: 'title'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ImageInputWidget(_selectImage),
                          const SizedBox(
                            height: 10,
                          ),
                          LocationInput()
                        ],
                      )))),
          TextButton.icon(
            onPressed: _saveplace,
            label: const Text('Add Place'),
            icon: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
