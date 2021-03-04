import 'package:flutter/material.dart';
import 'package:social_media/models/photo_model.dart';

PhotoModel obj = PhotoModel();

class ViewPhoto extends StatefulWidget {
  static String url1 = '';

  @override
  _ViewPhotoState createState() => _ViewPhotoState();
}

class _ViewPhotoState extends State<ViewPhoto> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: InteractiveViewer(
          child: Image.network(ViewPhoto.url1),
        ),
      ),
    );
  }
}
