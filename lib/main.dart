////// Copyright 2018 The Flutter team. All rights reserved.
////// Use of this source code is governed by a BSD-style license that can be
////// found in the LICENSE file.
////
import 'package:flutter/material.dart';
import "dart:math";

void main() => runApp(new MaterialApp(debugShowCheckedModeBanner: false,home: PositionedTiles()));

class PositionedTiles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  List<Widget> tiles = [
    //List<Color> colors = [const Color(0xFFfdd95b),const Color(0xff47356c)];
    StatefulColorfulTile(key: UniqueKey()),
    StatefulColorfulTile(key: UniqueKey()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterLab1'),
      ),
      body: Align(alignment: Alignment.topCenter, child:Row(children: tiles)),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.apps), onPressed: swapTiles),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class StatefulColorfulTile extends StatefulWidget {
  StatefulColorfulTile({Key key}) : super(key: key);
  @override
  createState() => new StatefulColorfulTileState();
}
class ColorGenerator{
  List<Color> colors = [Color(0xFFfdd95b), Color(0xff47356c), Colors.black, Colors.red];
  Color getColor(){
    return colors[Random().nextInt(2)];
  }
}
class StatefulColorfulTileState extends State<StatefulColorfulTile> {
  Color myColor;
  @override
  void initState() {
    super.initState();
    myColor = ColorGenerator().getColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: myColor,
        child: Padding(
          padding: EdgeInsets.all(70.0),
        ));
  }
}
