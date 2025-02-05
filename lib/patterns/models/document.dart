import 'dart:convert';

class Document {
  //
  Document() : _json = jsonDecode(documentJson);

  final Map<String, Object?> _json;

  // Records are a light and easy way to return multiple values
  // from a single function call and assign them to a variable

  // in records if you write any data not inside "{}" brackets
  // whenever you want to get access to the data it will provide you with
  // variables "$1", or "$2"
  // if you do not want to get likeabove and want to get records by their name
  // just write their inside "{}" brackets and get by their names
  ({String title, DateTime? datetime}) get recordMetada {
    final title = "Title";
    final datetime = DateTime.now();

    return (title: title, datetime: datetime);
  }
}

const documentJson = '''
{
  "metadata": {
    "title": "My Document",
    "modified": "2023-05-10"
  },
  "blocks": [
    {
      "type": "h1",
      "text": "Chapter 1"
    },
    {
      "type": "p",
      "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    },
    {
      "type": "checkbox",
      "checked": false,
      "text": "Learn Dart 3"
    }
  ]
}
''';
