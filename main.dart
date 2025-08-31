import 'package:flutter/material.dart';
import 'util.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 100;
  DateTime _lastUpdate = DateTime.now();

  void _incrementCounter() {
    setState(() {
      _counter++;
      _lastUpdate = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: AppUtils.getCounterColor(_counter),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // util.dartのAppUtilsを使用
            Text(
              AppUtils.getCounterText(_counter),
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppUtils.getCounterColor(_counter),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Last updated: ${AppUtils.formatTime(_lastUpdate)}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            // util.dartのIntExtensionsを使用
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Chip(
                  label: Text(_counter.isEven ? 'Even' : 'Odd'),
                  backgroundColor: _counter.isEven ? Colors.green[100] : Colors.orange[100],
                ),
                const SizedBox(width: 8),
                Chip(
                  label: Text('Squared: ${_counter.squared}'),
                  backgroundColor: Colors.blue[100],
                ),
                const SizedBox(width: 8),
                Chip(
                  label: Text(_counter.isPrime ? 'Prime' : 'Not Prime'),
                  backgroundColor: _counter.isPrime ? Colors.purple[100] : Colors.grey[100],
                ),
              ],
            ),
            const SizedBox(height: 16),
            // util.dartのAppUtils.getCounterEmojiを使用
            Text(
              AppUtils.getCounterEmoji(_counter),
              style: const TextStyle(fontSize: 48),
            ),
            const SizedBox(height: 24),
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: AppUtils.getCounterColor(_counter),
        child: const Icon(Icons.add),
      ),
    );
  }}