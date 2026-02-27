import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class Fruit {
  String name;
  int qty = 0;

  Fruit({required this.name});
}

var fruitList = [
  Fruit(name: "Apple"),
  Fruit(name: "Orange"),
  Fruit(name: "Grape"),
];

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/list': (context) => FruitListPage(), 
      // '/detail': (context) => FruitDetailPage()
      },
      // home: HomePage(),
      home: HomePage2(),
    );
  }
}


final pageList = [Home(), Account()];


class HomePage2 extends StatefulWidget {

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: pageList.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(text: "Home",),
            Tab(text: "Account",)
          ]),
        ),
        // body: pageList[index],
        body: TabBarView(children: pageList),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) => setState(() {
            index = value;
          }),
          items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "account"),
        ]),
      ),
    );
  }
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Home"),
    );
  } 
}


class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Account"),
    );
  } 
}



//---------------------------------------------------------------------------


class FruitListPage extends StatefulWidget {
  @override
  State<FruitListPage> createState() => _FruitListPageState();
}

class _FruitListPageState extends State<FruitListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: fruitList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(fruitList[index].name),
            subtitle: Text("Amount: ${fruitList[index].qty}"),
            onTap: () async {
              final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => FruitDetailPage(curFruit: fruitList[index])),);
              setState(() {
                fruitList[index].qty = result;
              });
            }
          );
        },
      ),
    );
  }
}

class FruitDetailPage extends StatefulWidget {

  final Fruit curFruit;

  FruitDetailPage({required this.curFruit});

  @override
  State<FruitDetailPage> createState() => _FruitDetailPageState();
}

class _FruitDetailPageState extends State<FruitDetailPage> {

  int qty = 0;

  @override
  void initState() {
    qty = widget.curFruit.qty;
  }


  @override
  Widget build(BuildContext context) {

    //Fruit curFruit = ModalRoute.of(context)!.settings.arguments as Fruit;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text("Detail page"),
            Text(widget.curFruit.name),
            // Text(widget.curFruit.qty.toString()),
            Text(qty.toString()),
            ElevatedButton(onPressed: () {
              Navigator.pop(context, qty);
            }, child: Text("Back")),
            ElevatedButton(onPressed: () {
              setState(() {
                qty++;
              });
            }
            , child: Text("+"))
          ],
        ),
      ),
    );  
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text('Home Page'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageA(),
                    settings: RouteSettings(arguments: "A"),
                  ),
                );
              },
              child: Text("Navigate to Page A"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/list');
              },
              child: Text("Navigate to Page List"),
            ),
          ],
        ),
      ),
    );
  }
}

class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text('Page A'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Pop Page"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageB()),
                );
              },
              child: Text("Navigate to Page B"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PageB()),
                );
              },
              child: Text("Navigate Replace to Page B"),
            ),
          ],
        ),
      ),
    );
  }
}

// Home -> A -> B -> C

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text("Page B"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Pop Page"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text("Pop Until Root"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(
                  context,
                  (route) => route.settings.arguments == "A",
                );
              },
              child: Text("Pop Until Page A"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageC()),
                );
              },
              child: Text("Navigate to Page C"),
            ),
          ],
        ),
      ),
    );
  }
}

class PageC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text("Page C"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Pop Page"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(
                  context,
                  (route) => route.settings.arguments == "A",
                );
              },
              child: Text("Pop Until Page A"),
            ),
          ],
        ),
      ),
    );
  }
}

// Homepage -> A -> C pushReplacement
// Homepage -> A -> B -> C push
