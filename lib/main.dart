import 'package:Covid19Kenya/help.dart';
import 'package:Covid19Kenya/home.dart';
import 'package:Covid19Kenya/information.dart';
import 'package:Covid19Kenya/precautions.dart';
import 'package:Covid19Kenya/settings.dart';
import 'package:Covid19Kenya/stats.dart';
import 'package:flutter/material.dart';
import 'package:Covid19Kenya/news.dart';

void main() => runApp(Application());

class Application extends StatelessWidget {
  static const String _title = 'Covid19Kenya';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/helpline': (context) => Help(),
        '/settings': (context) => Settings()
      },
      title: _title,
      home: Covid19Kenya(),
    );
  }
}

class Covid19Kenya extends StatefulWidget {
  Covid19Kenya({Key key}) : super(key: key);

  @override
  _Covid19KenyaState createState() => _Covid19KenyaState();
}

class _Covid19KenyaState extends State<Covid19Kenya> {
  int _selectedIndex = 0;

  var _widgetOptions = [Home(), Stats(), News(), Precautions(), Information()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            title: Text('stats'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pageview),
            title: Text('news'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            title: Text('Precautions'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text('Information'),
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.teal,
      ),
    );
  }
}
