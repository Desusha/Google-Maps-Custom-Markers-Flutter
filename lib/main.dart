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
