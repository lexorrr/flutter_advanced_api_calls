import 'package:flutter/material.dart';
import 'package:flutter_advanced_api_calls/api/http_client.dart';
import 'package:flutter_advanced_api_calls/api/json_models/todo.dart';
import 'package:flutter_advanced_api_calls/api/json_parsers/json_parser.dart';
import 'package:flutter_advanced_api_calls/widgets/error_widget.dart';

class HTTPWidget extends StatefulWidget {
  @override
  _HTTPWidgetState createState() => _HTTPWidgetState();
}

class _HTTPWidgetState extends State<HTTPWidget> {

  late final Future<List<Todo>> todos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todos = RequestREST(endpoint: '/todos')
        .executeGet<List<Todo>>(const TodoParser());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Todo>>(
      future: todos,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // Remember that 'snapshot.data' returns a nullable
          final data = snapshot.data ?? [];

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${data[index].title}'),
                onTap: () {},
              );
            },
          );
        }

        if (snapshot.hasError) {
          return const ErrorItemWidget();
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
