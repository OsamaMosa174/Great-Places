import 'dart:io';

import 'package:flutter/material.dart';
import 'package:offline_project/helpers/dp_helper.dart';
import 'package:offline_project/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];
  List<Place> get items {
    return [..._items];
  }

  addplace(String pickedtitle, File pickedImage) {
    final newplace = Place(
        id: DateTime.now().toString(),
        title: pickedtitle,
        location: null,
        image: pickedImage);
    _items.add(newplace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newplace.id,
      'title': newplace.title,
      'image': newplace.image.path
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: null,
          ),
        )
        .toList();
    notifyListeners();
  }
}
