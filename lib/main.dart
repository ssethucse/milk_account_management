import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Milk.dart';
import 'mydatatable.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Milks Account',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Milks Account'),
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

  final snackBar = SnackBar(
      content: Text('Data Saved!'),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating);

  final addSnackBar = SnackBar(
      content: Text('Milk Added!'),
      backgroundColor: Colors.teal,
      behavior: SnackBarBehavior.floating);

  final removeSnackBar = SnackBar(
      content: Text('Milk Removed!'),
      backgroundColor: Colors.redAccent,
      behavior: SnackBarBehavior.floating);


  List<Milk> _data = [];
  int textResult = 10;
  String dateVal = DateTime.now().toString().split(" ")[0];
  TextEditingController milkController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();

  @override
  void initState() {
    List.generate(3, (index) {
      _data.add(Milk('Aavin', 20, 10));
    });
    super.initState();
  }

  Future datePick() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2021),
        lastDate: new DateTime(2050));
    if (picked != null) {
      setState(() {
        dateVal = picked.toString().split(" ")[0];
      });
    }
  }

  void onAddClick() {}

  void onRemoveClick() {}

  void onSave() {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  void onAdd(){
    ScaffoldMessenger.of(context).showSnackBar(addSnackBar);
  }
  void onRemove(){
    ScaffoldMessenger.of(context).showSnackBar(removeSnackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        border: Border.all(color: Colors.blueGrey, width: 20)),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Add Milk : ",
                          style: TextStyle(fontSize: 24, color: Colors.blue),
                        ),
                        Expanded(
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Name'),
                                  controller: milkController,
                                ))),
                        Expanded(
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Price'),
                                  controller: priceController,
                                  keyboardType: TextInputType.number,
                                ))),
                        IconButton(
                          icon: new Icon(Icons.add_circle_sharp),
                          iconSize: 40,
                          color: Colors.teal,
                          highlightColor: Colors.blue,
                          onPressed: onAdd,
                        ),
                        IconButton(
                          icon: new Icon(Icons.remove_circle),
                          iconSize: 40,
                          color: Colors.teal,
                          highlightColor: Colors.blue,
                          onPressed: onRemove,
                        ),
                      ],
                    ))),
            Expanded(
                flex: 3,
                child: Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        border: Border.all(color: Colors.blueGrey, width: 15)),
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 8),
                                      child: new Text(dateVal,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.blue)))),
                              Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 8),
                                      child: IconButton(
                                        icon: new Icon(Icons.date_range),
                                        iconSize: 60,
                                        color: Colors.teal,
                                        highlightColor: Colors.blue,
                                        onPressed: datePick,
                                      ))),
                              Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 8),
                                      child: RaisedButton(
                                        padding: const EdgeInsets.all(20),
                                        child: Text('SAVE'),
                                        color: Colors.tealAccent,
                                        highlightColor: Colors.blue,
                                        onPressed: onSave,
                                      ))),
                              Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 8),
                                      child: RaisedButton(
                                        padding: const EdgeInsets.all(20),
                                        child: Text('REPORTS'),
                                        color: Colors.tealAccent,
                                        highlightColor: Colors.blue,
                                        onPressed: () => {},
                                      )))
                            ],
                          ),
                          Divider(),
                          Expanded(
                              child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                Expanded(
                                    child: SingleChildScrollView(
                                        child: PaginatedDataTable(
                                            rowsPerPage: 3,
                                            columns: [
                                              DataColumn(
                                                  label: Text('Name',
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          color: Colors.blue))),
                                              DataColumn(
                                                  label: Text('price',
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          color: Colors.blue))),
                                              DataColumn(
                                                  label: Text('Count',
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          color: Colors.blue))),
                                            ],
                                            source: MyDataTable(_data))))
                              ]))
                        ]))),
            /*Expanded(child: Charttable())*/
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
