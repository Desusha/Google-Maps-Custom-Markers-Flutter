import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_widget_to_image/utils.dart';
import 'package:flutter_widget_to_image/widget/widget_to_image.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey _globalKey = new GlobalKey();
  Uint8List _bytes = new Uint8List(0);
  List<Widget> bodyElements = [];
  void addBodyElement() {
    bodyElements.add(WidgetToImage(
        builder: (key) {
          this._globalKey = key;
          return ContentWidget();
        },
        key: GlobalKey()));
    buildImage(_bytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: ListView(
        padding: EdgeInsets.all(16),
        children: bodyElements,
      ),
      bottomSheet: Container(
        color: Theme.of(context).accentColor,
        padding: EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          // ignore: deprecated_member_use
          child: RaisedButton(
            color: Colors.white,
            child: Text('Capture'),
            onPressed: () async {
              final bytes1 = await Utils.capture(this._globalKey);
              setState(() {
                this._bytes = bytes1;
                addBodyElement();
              });
            },
          ),
        ),
      ),
    );
  }

  Widget buildImage(Uint8List bytes) {
    return bytes != null ? Image.memory(bytes) : Container();
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(98, 0, 238, 1),
      width: 150,
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Center(
                child: Text(
                  "Getu Commercial Business Center",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize:
                          Theme.of(context).textTheme.bodyText2!.fontSize),
                ),
              ),
              const Icon(
                Icons.flag_outlined,
                color: Colors.white,
                size: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
