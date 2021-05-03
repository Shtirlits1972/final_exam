import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:final_exam/constants.dart';
import 'package:final_exam/model/photo.dart';

class PhotoCrud{

Future<List<Photo>> getAll() async {
    // ignore: deprecated_member_use
    List<Photo> list = List<Photo>();

    try {

      var request =
          http.Request('GET', Uri.parse(host));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String data = await response.stream.bytesToString();

        var allData = (json.decode(data)['photos'] as List<dynamic>);
        for (int i = 0; i < allData.length; i++) {

          Photo photosOne = Photo(
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