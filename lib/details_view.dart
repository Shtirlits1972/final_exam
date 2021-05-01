import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  final String url;
  final String title;
  const DetailsView({Key key, this.url, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: double.infinity,
            child: Hero(
               tag: title,
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
              child: Image.network(url),
            ),
          ),
        ),
      ),
    );
  }
}
