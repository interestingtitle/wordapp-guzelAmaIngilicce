import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guzel_ama_ingilicce/screens/words/wordstest.dart';
import 'package:guzel_ama_ingilicce/screens/words/wordgetter.dart';
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
            // When a user taps the ListTile, navigate to the DetailScreen.
            // Notice that you're not only creating a DetailScreen, you're
            // also passing the current todo through to it.
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

    // Use the Todo to create the UI.
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
