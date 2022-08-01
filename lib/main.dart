import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ToDo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Entrydata> _todolist = List.empty(growable: true);

  String _text = "";
  String _desc = "";

  void addinList() {
    //construct entry data
    Entrydata data = Entrydata(_text, _desc);
    setState(() {
      _todolist.add(Entrydata(_text, _desc));
    });
  }

  void clearList() {
    setState(() {
      _todolist.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TodoList!'),
          actions: [
            IconButton(onPressed: clearList, icon:Icon(Icons.clear) )
          ],
        ),
      
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
                key: const Key("title"),
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (value) => _text = value),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
                key: const Key("description"),
                decoration: const InputDecoration(labelText: 'Description'),
                onChanged: (value) => _desc = value),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: _todolist.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    var element = _todolist[index];
                    return Container(
                        color: Color.fromARGB(255, 83, 148, 201),
                        child: Column(
                          children: [Text(element._text), Text(element._descr)],
                        ));
                  }))
        ]),
        floatingActionButton: FloatingActionButton(
          // onPressed: _incrementCounter,
          onPressed: addinList,
          tooltip: 'Adding Your To-Do of the Day',
          child: const Icon(Icons.add),
          backgroundColor: Theme.of(context).errorColor,
        ));
  }
}

class Entrydata {
  final String _text;
  final String _descr;

  Entrydata(this._text, this._descr);
  //set it directly during constructrion
}
