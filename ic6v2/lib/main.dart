import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rocket Launch Controller',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rocket Launch Controller')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              color: Colors.blue,
              child: Text('$_counter', style: const TextStyle(fontSize: 50.0)),
            ),
          ),
          Slider(
            min: 0,
            max: 100,
            value: _counter.toDouble(),
            onChanged: (double value) {
              setState(() {
                _counter = value.toInt();
              });
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.red,
          ),
          ElevatedButton(
            onPressed: _counter < 100
                ? () {
                    setState(() {
                      _counter++;
                    });
                  }
                : null,
            child: const Text('Ignite'),
          ),
          ElevatedButton(
            onPressed: _counter > 0
                ? () {
                    setState(() {
                      _counter--;
                    });
                  }
                : null,
            child: const Text('Decrement'),
          ),
          ElevatedButton(
            onPressed: _counter != 0
                ? () {
                    setState(() {
                      _counter = 0;
                    });
                  }
                : null,
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }
}
