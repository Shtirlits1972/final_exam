import 'package:final_exam/photo_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/photo_crud.dart';
import 'model/photo_repo.dart';
import 'model/photo.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => photo_repo()),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 600,
      color: Colors.white,
      child: Center(
        child: PhotoList(),
      ),
    );
  }

  Future loadPhotos(BuildContext context) async {
    // ignore: non_constant_identifier_names
    PhotoCrud photoCrud = PhotoCrud();
    List<Photo> list2 = await photoCrud.getAll();
    setState(() {
      Provider.of<photo_repo>(context, listen: false).setList(list2);
    });
  }

  @override
  void initState() {
    loadPhotos(context);
    super.initState();
  }
  
}
