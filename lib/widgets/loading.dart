import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image(image: new AssetImage("assets/images/nn.gif"))
            /* child: SpinKitCubeGrid(
          color: Theme.of(context).accentColor,
          size: 100.0,
        ) */));
  }
}
