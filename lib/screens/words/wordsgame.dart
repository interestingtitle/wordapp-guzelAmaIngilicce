import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guzelamaingilizce/screens/words/wordstest.dart';
import 'package:guzelamaingilizce/screens/words/wordgetter.dart';
class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}


class WordGame extends StatelessWidget {
  final List<Todo> todos;
  final List<WordData> wordsList;
  WordGame({Key key, @required this.todos, @required this.wordsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WordsTest(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Todo todo = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}
