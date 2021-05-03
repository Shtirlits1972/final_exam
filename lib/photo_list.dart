import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'details_view.dart';
import 'model/photo_crud.dart';
import 'model/photo_repo.dart';
import 'model/photo.dart';

class PhotoList extends StatefulWidget {
  PhotoList({Key key}) : super(key: key);

  @override
  _PhotoListState createState() => _PhotoListState();
}

class _PhotoListState extends State<PhotoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer(
        builder: (BuildContext context, photo_repo list3, Widget child) {
          return GridView.builder(
            itemCount: list3.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.greenAccent,
                padding: EdgeInsets.all(5.0),
                child: new Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsView(
                                  url: list3.getItem(index).src,
                                  title: list3.getItem(index).title,
                                )),
                      );
                    },
                    child: Hero(
                      tag: list3.getItem(index).title,
                      flightShuttleBuilder: (
                        BuildContext flightContext,
                        Animation<double> animation,
                        HeroFlightDirection flightDirection,
                        BuildContext fromHeroContext,
                        BuildContext toHeroContext,
                      ) {
                        return Icon(
                          Icons.view_comfy,
                          size: 150.0,
                        );
                      },
                      child: new GridTile(
                        header: Text(
                          list3.getItem(index).title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        child: Image.network(list3.getItem(index).src),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }


}
