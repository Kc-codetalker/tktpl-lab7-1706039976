import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Hello World'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _helloName = "World";

  void _updateHelloName(String name) {
    setState(() {
      _helloName = 'Hello, $name!';
    });
  }

  final nameInputController = TextEditingController();

  @override
  void dispose() {
    nameInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xFF008577),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              const SizedBox(width: 16,),
              Expanded(
                child: TextField(
                  controller: nameInputController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Enter new name',
                  ),
                ),
              ),
              const SizedBox(width: 16,),
              RaisedButton(
                onPressed: () {
                  _updateHelloName(nameInputController.text);
                },
                child: Text(
                  "ENTER",
                  style: Theme.of(context).textTheme.body2,
                ),
              ),
              const SizedBox(width: 16,),
            ],
          ),
          Expanded(
            child: Center(
              child: Text(
                _helloName
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.help_outline),
      ),
    );
  }
}
