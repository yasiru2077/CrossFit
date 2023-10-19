import 'package:flutter/material.dart';
import 'package:flutter_application_1/yasiru/utill/excercise_tile.dart';
import 'package:flutter_application_1/yasiru/utill/excercisetyp.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/yasiru/1/home_page.dart';
import 'package:flutter_application_1/yasiru/2/home_page.dart';
import 'package:flutter_application_1/navidu/paymentgateway/social_sharing/social_sharing_member.dart';
import 'package:flutter_application_1/navidu/paymentgateway/subscription_plan.dart';
import 'package:flutter_application_1/dhanish/Login, signup and admin screen/screens/signup_screen.dart';
import 'package:flutter_application_1/yasiru/notes/notes.dart';

class HomePage3 extends StatefulWidget {
  const HomePage3({Key? key}) : super(key: key);

  @override
  State<HomePage3> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage3> {
  final List excercisetyp = [
    [
      'bent-knee triceps dips',
      true,
    ],
    [
      'jumping jacks',
      false,
    ],
    [
      'lateral lunges',
      false,
    ],
    [
      'Pushup',
      false,
    ],
    [
      'Knee pushup',
      false,
    ],
    [
      'running in place with high knees',
      false,
    ],
    [
      'Russian Twist',
      false,
    ],
    [
      'secondplank',
      false,
    ],
    [
      'squats',
      false,
    ],
    [
      'squats',
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
          'Excercises For Intermediates',
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
              ExcerciseTile(
                excerciseImagePath: 'assets/images/Pushup.gif',
                excerciseName: 'Pushup',
                excerciseDescription:
                    'You can start with 20 push-ups, but do not stick to this number. It is important to keep increasing the number to challenge your body.',
                excerciseTime: '20-100times',
              ),
              ExcerciseTile(
                excerciseImagePath: 'assets/images/secondplank.gif',
                excerciseName: 'secondplank',
                excerciseDescription:
                    'This strengthens your back, chest, shoulders, neck, and abs',
                excerciseTime: '2mins',
              ),
              ExcerciseTile(
                excerciseImagePath: 'assets/images/bent-knee triceps dips.gif',
                excerciseName: 'bent-knee triceps dips',
                excerciseDescription:
                    'tricep dips best ways to tone and tighten the back of the upper arms.',
                excerciseTime: '30 times',
              ),
              ExcerciseTile(
                excerciseImagePath: 'assets/images/jumpingjacks.gif',
                excerciseName: 'jumping jacks',
                excerciseDescription:
                    'It helps you to Jumping helps to build bone strength over time. ',
                excerciseTime: '120 seconds',
              ),
              ExcerciseTile(
                excerciseImagePath: 'assets/images/lateral lunges.gif',
                excerciseName: 'lateral lunges',
                excerciseDescription:
                    'lateral lunges, are a type of bodyweight exercise.',
                excerciseTime: '20 times',
              ),
              ExcerciseTile(
                excerciseImagePath:
                    'lib/images/running in place with high knees.gif',
                excerciseName: 'running in place with high knees',
                excerciseDescription:
                    'improves cardiovascular endurance, burns calories.',
                excerciseTime: '2mins',
              ),
              ExcerciseTile(
                excerciseImagePath: 'assets/images/Russian Twist.gif',
                excerciseName: 'Russian Twist',
                excerciseDescription:
                    'The Russian twist is an effective way to build your core and shoulders.',
                excerciseTime: '40 times',
              ),
              ExcerciseTile(
                excerciseImagePath: 'assets/images/squats.gif',
                excerciseName: 'squats',
                excerciseDescription:
                    'Squats burn calories and might help you lose weight.',
                excerciseTime: '50 times',
              ),
              ExcerciseTile(
                excerciseImagePath: 'assets/images/WalkingLungs.gif',
                excerciseName: 'WalkingLungs',
                excerciseDescription:
                    'Walking lunges strengthen the leg muscles.',
                excerciseTime: '80 times',
              ),
            ],
          ),
        )
      ]),
    );
  }
}
