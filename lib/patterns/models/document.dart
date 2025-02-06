import 'dart:convert';

class Document {
  final String? type;
  final String? text;
  //
  Document({
    this.text,
    this.type,
  }) : _json = jsonDecode(documentJson);

  final Map<String, dynamic?> _json;

  // Records are a light and easy way to return multiple values
  // from a single function call and assign them to a variable

  // in records if you write any data not inside "{}" brackets
  // whenever you want to get access to the data it will provide you with
  // variables "$1", or "$2"
  // if you do not want to get likeabove and want to get records by their name
  // just write their inside "{}" brackets and get by their names
  ({String title, DateTime? datetime}) get recordMetada {
    final title = _json['metadata']['title'];
    final datetime = DateTime.parse(_json['metadata']['modified']);

    return (title: title, datetime: datetime);
  }

  factory Document.fromjson(Map<String, Object?> json) {
    if (json case {"type": final type, "text": final text}) {
      return Document(
        type: type as String?,
        text: text as String?,
      );
    }
    throw FormatException("Exception was thrown on");
  }

  List<Document> get documents {
    if (_json case {"blocks": List blocList}) {
      return [for (final each in blocList) Document.fromjson(each)];
    } else {
      throw FormatException("Unexpected type of json");
    }
  }

  void checkingJson(Map<String, dynamic> json) async {
    if (json case {"success": final bool success, "message": final String message}) {
      print("success with message: $success | $message");
    }

    if (json case {"success": final bool success}) {
      print('only success: $success');
    }
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
