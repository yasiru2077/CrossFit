// ignore_for_file: library_private_types_in_public_api, unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'social_sharing_member.dart';

class coachmessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<coachmessageScreen> {
  final _messageController = TextEditingController();
  List<String> _messages = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: const Text('Social Sharing Coach Page'),
        titleTextStyle: const TextStyle(
          color: Colors.orange,
          fontSize: 23.0,
          fontWeight: FontWeight.bold,
        ),
         leading: IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.orange),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
),
      body: Container(
        color: Colors.black,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                  return Container(
                decoration: const BoxDecoration(
                    color: Colors.black,
                ),
                child: ListTile(
                    title: Text(_messages[index], style: const TextStyle(color: Colors.white),),
                          ),
                      );
                  },
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                hintText: 'Enter a message',
                hintStyle: TextStyle(color: Colors.white),
              ),
               style: const TextStyle(color: Colors.white),
               cursorColor: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () async {
                setState(() {
                  _messages.add(_messageController.text);      
                });
                await sendMessage(_messageController.text);
                _messageController.clear();
                },
                child: const Text('Send', style: TextStyle(color: Colors.black),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// The asynchronous function named sendMessage.(used to send data to database and to validate.)
Future<void> sendMessage(String message) async {
  final response = await http.post(
    Uri.parse("http://10.0.2.2:5000/message"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({'message': message}),
  );
  if (response.statusCode != 200) {
    print('Error sending message: ${response.body}');
  } else {
    print('Message sent successfully');
  }
}
