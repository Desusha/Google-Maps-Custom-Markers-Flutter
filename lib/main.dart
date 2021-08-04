import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_widget_to_image/widget/my_painter.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Custom Markers'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Uint8List> _myPaintToBitmap(String lable) async {
    ui.PictureRecorder recorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(recorder);
    MyPainter myPainter = MyPainter(lable);

    myPainter.paint(canvas, Size(300, 70));

    final ui.Image image = await recorder.endRecording().toImage(300, 70);

    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);

    return byteData!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0099aa),
        body: Center(
          child: Container(
            width: 200,
            height: 50,
            color: Colors.white,
            child: CustomPaint(
              painter: MyPainter(),
            ),
          ),
        ));
  }
}
