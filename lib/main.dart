import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        builder: (context) => new TickerState(),
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: MyHomePage()));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tick = Provider.of<TickerState>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Count using proivder & notifier')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              tick.ticked.toString(),
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => tick.tick(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class TickerState with ChangeNotifier {
  int _ticked = 0;

  int get ticked => _ticked;

  set ticked(int num) {
    _ticked++;
    notifyListeners();
  }

  tick() {
    _ticked++;
    notifyListeners();
  }
}
