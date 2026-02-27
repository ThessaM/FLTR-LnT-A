import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              const Text('You have pushed the button this many times:'),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Row(
                mainAxisAlignment: .center,
                spacing: 12,
                children: [
                  Icon(Icons.favorite),
                  Icon(Icons.alarm),
                  Icon(Icons.phone)
                ],
              ),
              Stack(
                alignment: .center,
                children: [
                  Icon(Icons.home, color: Colors.lightBlue, size: 100,),
                  Icon(Icons.abc, color: Colors.red, size: 50,),
                ],
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.black,
                    Colors.yellow
                  ])
                ),
              ),
              Text(
                "Hello World", 
                style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w600
              ),
              ),
              Image.network("https://www.daily.co/blog/content/images/2023/07/Flutter-feature.png"),
              Icon(Icons.account_balance),
              ElevatedButton(
                onPressed: () {}, 
                child: Text("This is a Button"),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.account_box)),
              MyWidget("Title A"),
              MyWidget("Title B"),
              MyWidget("Title C"),
              MyWidget("Title D"),
              MyWidget("Title E"),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Text("FAB"),
      ),

    );
  }
}


class MyWidget extends StatelessWidget {

  const MyWidget(this.cardTitle);

  final String cardTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.purple.shade200,
      child: Column(
        children: [
          Text(cardTitle),
          Icon(Icons.arrow_back),
          Text("This is my Widget")
        ],
      ),
    );
  }
}