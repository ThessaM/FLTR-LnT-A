import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: HomePage()),
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
            HomeComp()
            // HomeForm(),
            // Expanded(child: ListPage2()),
          ],
        ),
      ),
    );
  }
}

final listItems = ["Apple", "Orange", "Banana", "Grape"];

class ListPage2 extends StatefulWidget {
  @override
  State<ListPage2> createState() => _ListPage2State();
}

class _ListPage2State extends State<ListPage2> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listItems.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(listItems[index]),
          child: ListTile(title: Text(listItems[index])),
          onDismissed: (direction) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Removed ${listItems[index]}"),
                duration: Duration(seconds: 1),
              ),
            );
          },
          background: Container(color: Colors.lightGreenAccent),
        );
      },
    );
  }
}


class HomeForm extends StatefulWidget {
  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  final formKey = GlobalKey<FormState>();

  String username = "";
  String password = "";

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Text("Hello $username, with password $password"),
          TextFormField(
            decoration: InputDecoration(labelText: "username"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Must be filled";
              }
              return null;
            },
            controller: usernameController,
            // onSaved: (newValue) {
            //   setState(() {
            //     username = newValue!;
            //   });
            // },
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(labelText: "password"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Must be filled";
              } else if (value.length < 5) {
                return "Must be longer than 5 char";
              }
              return null;
            },
            controller: passwordController,
            // onSaved: (newValue) {
            //   password = newValue!;
            // },
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                setState(() {
                  username = usernameController.text;
                  password = passwordController.text;
                });
                // formKey.currentState!.save();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(seconds: 2),
                    content: Text("Username: $username & Pass: $password"),
                    action: SnackBarAction(
                      label: "reset",
                      onPressed: () {
                        setState(() {
                          password = "reset";
                        });
                      },
                    ),
                  ),
                );

                formKey.currentState!.reset();
              }
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}

//-------------------------------------------------------

final dropDownList = ["Apple", "Orange", "Banana", "Grape"];

class HomeComp extends StatefulWidget {
  @override
  State<HomeComp> createState() => _HomeCompState();
}

class _HomeCompState extends State<HomeComp> {
  bool checkboxState = false;
  String? dropdownState;
  String textState = "Hello";
  Color containerState = Colors.black;

  String radioState = 'A';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      children: [
        Checkbox(
          value: checkboxState,
          onChanged: (value) {
            setState(() {
              checkboxState = !checkboxState;
            });
          },
        ),

        // RadioGroup(onChanged: onChanged, child: child)
        
        Radio<String>(
          value: 'A',
          groupValue: radioState,
          onChanged: (value) {
            setState(() {
              radioState = 'A';
            });
          },
        ),
        Text("Option A"),

        Radio<String>(
          value: 'B',
          groupValue: radioState,
          onChanged: (value) {
            setState(() {
              radioState = 'B';
            });
          },
        ),
        Text("Option B"),

        DropdownButton(
          value: dropdownState,
          items: dropDownList
              .map((e) => DropdownMenuItem(child: Text(e), value: e))
              .toList(),
          onChanged: (value) {
            setState(() {
              dropdownState = value;
            });
          },
        ),

        if (checkboxState)
          TextButton(
            onPressed: () {
              setState(() {
                textState = textState == "Hello" ? "World" : "Hello";
              });
            },
            child: Text(textState),
          ),

        ElevatedButton(
          onPressed: () {
            setState(() {
              textState = textState == "Hello" ? "World" : "Hello";
            });
          },
          child: Text(textState),
        ),

        GestureDetector(
          onTap: () {
            setState(() {
              containerState = Colors.deepPurpleAccent;
            });
          },
          onDoubleTap: () {
            setState(() {
              containerState = Colors.lightBlueAccent;
            });
          },
          onLongPress: () {
            setState(() {
              containerState = Colors.lightGreenAccent;
            });
          },
          child: Container(width: 100, height: 100, color: containerState),
        ),

        InkWell(
          onTap: () {
            setState(() {
              containerState = Colors.orangeAccent;
            });
          },
          splashColor: Colors.tealAccent,
          child: Container(
            width: 100,
            height: 100,
            color: containerState.withAlpha(100),
          ),
        ),
      ],
    );
  }
}
