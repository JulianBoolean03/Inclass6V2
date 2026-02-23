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

  Color? countdownStatus(){
    if(_counter == 0){
      return Colors.red;
    } else if (_counter > 0 && _counter <= 50){
      return Colors.yellow;
    } else if (_counter > 50 && _counter <= 100){
      return Colors.green;
    } else {
      return null;
    }
  }

  String liftofflogic(){
    if(_counter == 100){
      return 'LIFTOFF!';
    } else {
      return '$_counter';
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rocket Launch Controller')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              color: countdownStatus(),
              child: Text(liftofflogic(), style: const TextStyle(fontSize: 50.0)),
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
