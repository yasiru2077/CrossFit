import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Welcome to CrossFit',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          containerWidget(),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          containerWidget(),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          containerWidget(),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          activityWidget()
        ],
      ),
    );
  }

  Widget containerWidget() {
    return Expanded(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: const Text('Welcome to CrossFit',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ),
            const SizedBox(height: 20),
            Center(
              child: const Text('[Enter your name]',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.normal)),
            ),
          ],
        ),
      ),
    );
  }

  Widget activityWidget() {
    return Expanded(
      flex: 3,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: const Text('Your Regular Physical Activity Level',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: DropdownButton(
                isDense: true,
                hint: const Text('Select Activity Level'),
                items: [
                  DropdownMenuItem(
                    child: const Text('Sedentary'),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: const Text('Lightly Active'),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: const Text('Moderately Active'),
                    value: 3,
                  ),
                  DropdownMenuItem(
                    child: const Text('Very Active'),
                    value: 4,
                  ),
                  DropdownMenuItem(
                    child: const Text('Extremely Active'),
                    value: 5,
                  ),
                ],
                onChanged: (value) {
                  print(value);
                },
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Icon(Icons.arrow_back),
                ),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Color.fromARGB(255, 255, 231, 14),
                    onPressed: () {},
                    child: const Text('Next'))
              ],
            )
          ],
        ),
      ),
    );
  }
}