import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.teal,
      ),
      body: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'HEAD ACHE . FEVER . DRY COUGH . BREATHING DIFFICULTY',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Container(
            child:
                Image.network('https://covid19kenya.site/images/infected.png')),
        Column(
          children: [
            Container(
              child: FlatButton(
                child: Text('Get Help'),
              ),
            ),
            Container(
              child: FlatButton(
                child: Text('Settings'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
