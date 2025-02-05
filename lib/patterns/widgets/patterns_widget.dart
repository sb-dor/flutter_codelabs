import 'package:flutter/material.dart';
import 'package:flutter_codelabs/patterns/models/document.dart';

class PatternsWidget extends StatefulWidget {
  const PatternsWidget({super.key});

  @override
  State<PatternsWidget> createState() => _PatternsWidgetState();
}

class _PatternsWidgetState extends State<PatternsWidget> {
  // YOU CAN REMOVE "late"s if you are setting value directly

  // you can create variable of typr records:
  // for ex create a record variable that takes "title" and "datetime" inside record
  late final ({String title, DateTime? datetime}) _recordData;

  // for example records will be useful for map positions (latitude, longitude)
  late final ({double latitude, double longitude}) _locations;

  // The first field is positional and unnamed, and the second field is named "modified".
  late final (String name, {String sirname}) _nameOfStudent;

  //
  final _document = Document();

  @override
  void initState() {
    super.initState();
    _recordData = _document.recordMetada;

    _locations = (latitude: 150, longitude: 100);

    _nameOfStudent = ("Alex", sirname: "Bezrukov");

    // if you want to set them inside vairable
    // this is one of the types of patterns
    final (nameOftheStudent, :sirname) = _nameOfStudent;

    print(nameOftheStudent);

    print(sirname);

    patterns();
  }

  void patterns() {
    final number = 14;
    switch (number) {
      // Constant pattern matches if 1 == number.
      case 1:
        print("111");
        break;

      // means if number is more then 10 and less then 10
      case > 10 && <= 15:
        print("number is between: $number");
    }

    // list patterns
    const String a = 'a';
    const String b = 'b';
    final test = ['a'];
    switch (test) {
      // list patterns
      case [a, b]:
    }

    //
    var (firstVar, secondVar) = ('left', 'right');
    print(firstVar);
    print(secondVar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patterns widget test"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _recordData.title,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            _recordData.datetime.toString(),
            style: TextStyle(fontSize: 18),
          ),

          // you can call positional (unnamed) fields like this :
          Text(_nameOfStudent.$1),
          // you can call modified (named) fields like this :
          Text(_nameOfStudent.sirname),
        ],
      ),
    );
  }
}
