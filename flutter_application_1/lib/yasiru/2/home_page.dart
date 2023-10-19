import 'package:flutter/material.dart';
import 'package:flutter_application_1/yasiru/2/utill/excercisetyp.dart';
import 'package:flutter_application_1/yasiru/2/utill/coffee_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/yasiru/1/home_page.dart';
import 'package:flutter_application_1/yasiru/home_page.dart';
import 'package:flutter_application_1/navidu/paymentgateway/social_sharing/social_sharing_member.dart';
import 'package:flutter_application_1/navidu/paymentgateway/subscription_plan.dart';
import 'package:flutter_application_1/dhanish/Login, signup and admin screen/screens/signup_screen.dart';
import 'package:flutter_application_1/yasiru/notes/notes.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {
  final List excercisetyp = [
    [
      'Bridge',
      true,
    ],
    [
      'Bicycle crunch',
      false,
    ],
    [
      'Side-lying hip abduction',
      false,
    ],
    [
      'Stationary lunge',
      false,
    ],
    [
      'Knee pushup',
      false,
    ],
  ];
  void excerciseTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < excercisetyp.length; i++) {
        excercisetyp[i][1] = false;
      }
      excercisetyp[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.orange),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupScreen()));
            },
          ),
        ],
        
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            children: [
              ListTile(
                title: Text(
                  'Beginner Workout',
                  style: TextStyle(color: Colors.white,
                   fontSize: 17, 
                   fontWeight: FontWeight.bold),
                  ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage2()),
                  );
                },
              ),
              ListTile(
                title: Text('Intermediate Workout',
                style: TextStyle(color: Colors.white, 
                fontSize: 17,
                fontWeight: FontWeight.bold
                ),),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage3()),
                  );
                },
              ),
              ListTile(
                title: Text('Advance Workout',
                style: TextStyle(color: Colors.white, 
                fontSize: 17,
                fontWeight: FontWeight.bold
                ),),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage1()),
                  );
                },
              ),
              ListTile(
              title: Text('Member Social Sharing',
              style: TextStyle(color: Colors.white, 
                fontSize: 17,
                fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MessagesListScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Notes',
              style: TextStyle(color: Colors.white, 
                fontSize: 17,
                fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotePage()),
                );
              },
            ),
            ListTile(
              title: Text('Subscription Plan',
              style: TextStyle(color: Colors.white, 
                fontSize: 17,
                fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubscriptionPage()),
                );
              },
            ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: '',
        ),
      ]),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "Success usually comes to those who are too busy to be looking for it.",
            style: GoogleFonts.bebasNeue(
              fontSize: 40,
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Text(
          'Excercises For Beginners',
          style: GoogleFonts.bebasNeue(
            fontSize: 30,
            color: Colors.amber,
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: excercisetyp.length,
            itemBuilder: (context, index) {
              return ExcerciseTyp(
                excerciseType: excercisetyp[index][0],
                isselected: excercisetyp[index][1],
                onTap: () {
                  excerciseTypeSelected(index);
                },
              );
            },
          ),
        ),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeTile(
                excerciseImagePath: 'assets/images/Knee pushup.gif',
                excerciseName: 'Knee pushup',
                excerciseDescription:
                    'From is you can get chest, shoulders and arms a quality workout',
                excerciseTime: '10 times',
              ),
              CoffeTile(
                excerciseImagePath: 'assets/images/Bicycle crunch.gif',
                excerciseName: 'Bicycle crunch',
                excerciseDescription:
                    'It helps you to engage a wide range of muscle groups.',
                excerciseTime: '120 seconds',
              ),
              CoffeTile(
                excerciseImagePath:
                    'assets/images/Side-lying hip abduction.gif',
                excerciseName: 'lying hip abduction',
                excerciseDescription:
                    'Helps the hips and knee area of your body.',
                excerciseTime: '20 times',
              ),
              CoffeTile(
                excerciseImagePath: 'assets/images/Bridge.gif',
                excerciseName: 'Bridge',
                excerciseDescription:
                    'A bridge exercise isolates and strengthens your gluteus (butt) muscles.',
                excerciseTime: '20 times',
              ),
              CoffeTile(
                excerciseImagePath: 'assets/images/Stationary lunge.gif',
                excerciseName: 'Stationary lunge',
                excerciseDescription:
                    'Stationary lunges target your glutes, quadriceps, and hamstrings.',
                excerciseTime: '20 times',
              ),
            ],
          ),
        )
      ]),
    );
  }
}
