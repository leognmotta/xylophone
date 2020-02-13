import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final player = AudioCache();
  final List<int> keys = Iterable<int>.generate(7).toList();
  final colors = {
    '1': Colors.red,
    '2': Colors.orange,
    '3': Colors.yellow,
    '4': Colors.green,
    '5': Colors.teal,
    '6': Colors.blue,
    '7': Colors.purple,
  };

  void playSound(int note) {
    player.play('sounds/note$note.wav');
  }

  Widget buildKey({
    @required Color color,
    @required int note,
  }) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () => playSound(note),
        child: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: keys
                .map(
                  (key) => buildKey(
                    color: colors[(key + 1).toString()],
                    note: key + 1,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
