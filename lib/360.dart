import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Panorama(
            child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/real-estate-demo-v1.appspot.com/o/tu09tpc-a-large-bed-in-a-room%20(1).jpeg?alt=media&token=2df0cf1d-506e-4d85-b028-2ffcad418b98'),
          )),
    );
  }
}
