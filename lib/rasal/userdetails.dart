import 'package:flutter/material.dart';
import 'package:flutter_application_1/yasiru/1/home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_1/yasiru/2/home_page.dart';

class userdetailsform extends StatefulWidget {
  @override
  userdetailsformstate createState() => userdetailsformstate();
}

class userdetailsformstate extends State<userdetailsform> {
  String goal = 'Daily';
  int weight = 0;
  int height = 0;
  int age = 0;
  TextEditingController weightcontroller = TextEditingController();
  TextEditingController heightcontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  final formdets = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Welcome to CrossFit",
          style: TextStyle(color: Color(0xFFFCB040)),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 16),
        child: Form(
          key: formdets,
          child: Column(
            children: [
              goalContainer(),
              const SizedBox(height: 15),
              textFieldContainer(
                  'Weight', "What's your weight?", weightcontroller),
              const SizedBox(height: 15),
              textFieldContainer(
                  'Height', "What's your height?", heightcontroller),
              const SizedBox(height: 15),
              textFieldContainer('Age', "How old are you?", agecontroller),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        submitForm();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage1()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFCB040),
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 70,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          )),
                      child: const Text(
                        'Next',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget goalContainer() {
    return Expanded(
      child: Column(
        children: [
          Center(
            child: Text("What's your goal?",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: 'Goal',
                labelStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
              iconEnabledColor: Colors.white,
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
              value: goal,
              onChanged: (newValue) {
                setState(() {
                  goal = newValue!;
                });
              },
              items: const [
                DropdownMenuItem(
                  child: Text(
                    'Daily',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: 'Daily',
                ),
                DropdownMenuItem(
                  child: Text(
                    'Weekly',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: 'Weekly',
                ),
                DropdownMenuItem(
                  child: Text(
                    'Monthly',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: 'Monthly',
                ),
              ],
              dropdownColor: Colors.black,
            ),
          ),
          const SizedBox(height: 0),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ],
      ),
    );
  }

  Widget textFieldContainer(lable, text, controller) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(text,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ),
          Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: lable,
                labelStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
              style: const TextStyle(color: Colors.white),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter ${lable.toString().toLowerCase()}';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 15),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          )
        ],
      ),
    );
  }

  void submitForm() async {
    if (formdets.currentState!.validate()) {
      formdets.currentState!.save();
      try {
        final response = await http.post(
          Uri.parse('http://10.0.2.2:5000/userdetails'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'goal': goal,
            'weight': int.parse(weightcontroller.text.trim()),
            'height': int.parse(heightcontroller.text.trim()),
            'age': int.parse(agecontroller.text.trim()),
          }),
        );

        if (response.statusCode == 201) {
          print('Data saved successfully!');
          agecontroller.clear();
          heightcontroller.clear();
          weightcontroller.clear();
          setState(() {});
        } else {
          print('An error occurred while saving data: ${response.statusCode}');
        }
      } catch (error) {
        print('An error occurred while saving data: $error');
      }
    }
  }
}
