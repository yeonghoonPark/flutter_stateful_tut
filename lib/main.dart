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
  bool showTitle = true;

  void onClicked() {
    setState(() {
      counter = counter + 1;
      numbers.add(counter);
    });
  }

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Test MyApp');
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
              showTitle == true ? const MyLargeTitle() : const Text(''),
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
              ),
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(Icons.remove_red_eye),
                iconSize: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  int count = 0;

  // initState method's to be executed before build(does that mean before it's monuted?)
  @override
  void initState() {
    super.initState();
    print('Test initState');
  }

  // dispose method's to be executed before unmounted
  @override
  void dispose() {
    super.dispose();
    print('Test dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('Test build');
    return Text(
      'Title',
      style: TextStyle(
        fontSize: 50,
        color: Theme.of(context).textTheme.titleLarge!.color,
      ),
    );
  }
}
