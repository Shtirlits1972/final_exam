import 'package:flutter/material.dart';

import 'photos.dart';

class photo_repo with ChangeNotifier {
  List<photos> _photosList = List<photos>();

  List<photos> get getPhotos => _photosList;

  void addPhoto(photos newPhoto) {
    _photosList.add(newPhoto);
  }

  void setList(List<photos> listInput) {
    _photosList = listInput;
  }

  int get length =>_photosList.length;

   photos getItem(int index)
   {
     return _photosList.elementAt(index);
   }

}
