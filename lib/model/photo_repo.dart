import 'package:flutter/material.dart';

import 'photo.dart';

class photo_repo with ChangeNotifier {
  List<Photo> _photosList = List<Photo>();

  List<Photo> get getPhotos => _photosList;

  void addPhoto(Photo newPhoto) {
    _photosList.add(newPhoto);
  }

  void setList(List<Photo> listInput) {
    _photosList = listInput;
  }

  int get length =>_photosList.length;

   Photo getItem(int index)
   {
     return _photosList.elementAt(index);
   }

}
