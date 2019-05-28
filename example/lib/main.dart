import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:load/load.dart';

void main() {
  runApp(
    LoadingProvider(
      themeData: LoadingThemeData(
          // tapDismiss: false,
          ),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    showAndDelayDismiss();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    showAndDelayDismiss();
  }

  void showAndDelayDismiss(
      [Duration duration = const Duration(seconds: 2)]) async {
    var future = await showLoadingDialog();
    Future.delayed(duration, () {
      future.dismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {
              showCustomLoadingWidget(
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        LinearProgressIndicator(),
                        Container(
                          height: 10,
                        ),
                        Text("加载中"),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
