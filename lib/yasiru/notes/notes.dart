import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NotePage extends StatefulWidget {
  @override
  NotePageState createState() => NotePageState();
}

class NotePageState extends State<NotePage> {
  final formKey = GlobalKey<FormState>();
  late String note;

  List<String> notes = [];

  void _submitNote() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      setState(() {
        notes.add(note);
      });

      http
          .post(Uri.parse('http://10.0.2.2:5000/notes'),
              headers: {"Content-Type": "application/json"},
              body: jsonEncode({'note': note}))
          .then((response) {
        if (response.statusCode == 200) {
          print("Note saved successfully!");
          formKey.currentState!.reset(); //clears the field
        } else {
          print("Error saving note.");
        }
      }).catchError((error) {
        print("An error occured: $error");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text(
            'Add Note',
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Note',
                        labelStyle: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        errorStyle: TextStyle(color: Colors.black)),
                    validator: (value) {
                      const TextStyle(color: Colors.black);
                      if (value!.isEmpty) {
                        return 'Please enter a note';
                      }
                    },
                    onSaved: (value) => note = value!,
                  ),
                  ElevatedButton(
                    onPressed: _submitNote,
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                      key: Key(notes[index]),
                      onDismissed: (direction) {
                        setState(() {
                          notes.removeAt(index);
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            border: Border.all(color: Colors.amber, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          margin: const EdgeInsets.only(bottom: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text(notes[index]),
                              trailing: const Icon(Icons.delete),
                            ),
                          )));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
