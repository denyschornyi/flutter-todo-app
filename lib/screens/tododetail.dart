import 'package:flutter/material.dart';
import 'package:todo_flutter/model/todo.dart';
import 'package:todo_flutter/util/dbhelper.dart';
import 'package:intl/intl.dart';

class TodoDetail extends StatefulWidget {
  final Todo todo;

  TodoDetail(this.todo);

  @override
  State<StatefulWidget> createState() => TodoDetailState(this.todo);
}

class TodoDetailState extends State {
  Todo todo;

  TodoDetailState(this.todo);

  final _priorities = ["High", "Medium", "Low"];
  String _priority = "Low";
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = todo.title;
    descriptionController.text = todo.description;

    TextStyle textStyle = Theme.of(context).textTheme.headline6;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(todo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 35, left: 10, right: 10),
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                TextField(
                  controller: titleController,
                  style: textStyle,
                  decoration: InputDecoration(
                      labelText: "Title",
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: TextField(
                    controller: descriptionController,
                    style: textStyle,
                    decoration: InputDecoration(
                        labelText: "Description",
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                ListTile(
                    title: DropdownButton<String>(
                  items: _priorities.map((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  style: textStyle,
                  value: "Low",
                  onChanged: null,
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
