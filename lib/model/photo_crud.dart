import 'package:final_exam/model/photo_repo.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:final_exam/constants.dart';
import 'package:final_exam/model/photos.dart';

class photo_crud{

Future<List<photos>> getAll() async {
    // ignore: deprecated_member_use
    List<photos> list = List<photos>();

    try {

      var request =
          http.Request('GET', Uri.parse(host));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String data = await response.stream.bytesToString();

        var allData = (json.decode(data)['photos'] as List<dynamic>);
        for (int i = 0; i < allData.length; i++) {

          photos photosOne = photos(
            id: allData[i]['id'],
            title: allData[i]['title'],
            src: allData[i]['src']
          );

          list.add(photosOne);
        }
      } else {
        print(response.reasonPhrase);
      }
    } on Exception catch (exception) {
      print('exception: $exception');
    } catch (error) {
      print('error: $error');
    }
    return list;
  }

 }