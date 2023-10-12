import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;
  List<int> numbers = [];

  void onClicked() {
    setState(() {
      counter = counter + 1;
      numbers.add(counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
            titleLarge: TextStyle(
          fontSize: 50,
          color: Colors.red[400],
        )),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MyLargeTitle(),
              const Text(
                'Click Count',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                '$counter',
                style: const TextStyle(fontSize: 30),
              ),
              for (var number in numbers) Text('$number'),
              IconButton(
                onPressed: onClicked,
                icon: const Icon(Icons.add_box_rounded),
                iconSize: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatelessWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Title',
      style: TextStyle(
        fontSize: 50,
        color: Theme.of(context).textTheme.titleLarge!.color,
      ),
    );
  }
}
