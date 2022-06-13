import 'package:flutter/material.dart';

import 'package:flutter_cube/flutter_cube.dart';

class ViewImagesObjects extends StatefulWidget {

  final String fileName;
  const ViewImagesObjects({
    Key? key,
    required this.fileName,
  }) : super(key: key);

  @override
  State<ViewImagesObjects> createState() => _ViewImagesObjectsState();
}

class _ViewImagesObjectsState extends State<ViewImagesObjects> {

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height,
      child: Center(
        child: Cube(
          onSceneCreated: (Scene scene) {
            scene.world.add(
              Object(
                fileName: widget.fileName,
              ),
            );
            scene.camera.zoom = 8;
          },
        ),
      ),
    );
  }

}
