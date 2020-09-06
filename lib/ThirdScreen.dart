import 'package:flutter/material.dart';
import 'package:kinetics_task/Photos.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: new Text("Third Screen",
          textAlign: TextAlign.center
          ),
        )
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData ? PhotoList(photos: snapshot.data)
              : Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}


class PhotoList extends StatelessWidget {

  final List<Photo> photos;

  PhotoList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
        ),
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return Image.network(photos[index].thumbnailUrl);
        },

    );
  }
}
