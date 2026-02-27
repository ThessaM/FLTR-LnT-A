import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        // fontFamily: 'Oswald',
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        scaffoldBackgroundColor: Colors.purple,
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.blue,
          backgroundColor: Colors.black,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.purple),
          titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.purple),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green
          )
        )
      ),
      home: ListPage()
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App bar", style: Theme.of(context).textTheme.titleLarge,),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Theme.of(context).colorScheme.primary,
                ),
                ElevatedButton(onPressed: () {}, child: Text("Themed Button")),
                Text("Local Font", style: TextStyle(fontFamily: 'Oswald', fontWeight: FontWeight.w700),),
                Text("Google Font", style: GoogleFonts.roboto(fontWeight: FontWeight.w700),),
                Image.asset('assets/images/fltr.png'),
        
                //Animation
                CustomBoxAnimation(),
                CustomBoxAnimation2()
              ],
            ),
          ),
      ),
    );
  }
}

class CustomBoxAnimation extends StatefulWidget {
  @override
  State<CustomBoxAnimation> createState() => _CustomBoxAnimationState();
}

class _CustomBoxAnimationState extends State<CustomBoxAnimation> {

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: isExpanded ? 1 : 0.5,
        child: AnimatedContainer(
          width: isExpanded ? 200 : 100,
          height: isExpanded ? 300 : 100,
          color: isExpanded ? Colors.amber : Colors.blue,
          duration: Duration(milliseconds: 500)
        ),
      ),
    );
  }
}


class CustomBoxAnimation2 extends StatefulWidget {
  @override
  State<CustomBoxAnimation2> createState() => _CustomBoxAnimation2State();
}

class _CustomBoxAnimation2State extends State<CustomBoxAnimation2> with SingleTickerProviderStateMixin{

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final scale = Tween(begin: 0.5, end: 1.0).animate(controller);

    return Column(
      mainAxisAlignment: .center,
      children: [
        
        ScaleTransition(
          scale: scale,
          child: FadeTransition(
            opacity: controller,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          ),
        ),
        ElevatedButton(onPressed: () => controller.forward(), child: Text("Run")),
        ElevatedButton(onPressed: () => controller.reset(), child: Text("Reset")),
        ElevatedButton(onPressed: () => controller.repeat(reverse: true), child: Text("Repeat"))
      ],
    );
  }
}


class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            CustomBoxAnimation(),
            CustomBoxAnimation(),
            CustomBoxAnimation(),
            CustomBoxAnimation(),
            CustomBoxAnimation(),
            CustomBoxAnimation(),
            CustomBoxAnimation(),
            CustomBoxAnimation(),
          ],
        ),
      ),
    );
  }
}