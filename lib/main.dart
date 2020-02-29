import 'package:flutter/material.dart';
import 'package:testing_dropdown_tap_issue/model.dart';

void main() => runApp(MyApp(model: Model()));

class MyApp extends StatefulWidget {
  MyApp({@required this.model});
  final Model model;
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedValue = 0;
  final values = [0, 1, 2, 3];

  Model get model => widget.model;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: DropdownButton<int>(
          isExpanded: true,
          iconSize: 40,
          hint: Text('Select number'),
          value: selectedValue,
          items: values.map((int item) {
            return DropdownMenuItem<int>(
              value: item,
              child: Text(
                item.toString(),
                key: Key(item.toString()),
              ),
            );
          }).toList(),
          onChanged: (value) {
            model.updateSelection(value);
            setState(() {
              selectedValue = value;
            });
          },
        ),
      ),
    );
  }
}
