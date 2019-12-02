import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

var clr = Colors.deepPurple;

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: clr[900],
          title: Center(child: Text('Xylo')),
        ),
        body: SafeArea(
          child: Pads(),
        ),
      ),
    );
  }
}

class Pads extends StatefulWidget {
  @override
  _PadsState createState() => _PadsState();
}

class _PadsState extends State<Pads> {
  var list = [1, 2, 3, 4, 5, 6, 7];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          for (var item in list)
            Expanded(
              child: FlatButton(
                onPressed: () {
                  final player = AudioCache();
                  player.play('note$item.wav');
                },
                padding: EdgeInsets.all(0),
                color: clr[item * 100],
                child: null,
              ),
            ),
        ],
      ),
    );
  }
}
