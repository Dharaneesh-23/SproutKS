import 'package:flutter/material.dart';
import 'package:sprout_lms/pages/ongoing_course.dart';
import 'package:sprout_lms/pages/enrolled_course.dart';
import 'package:sprout_lms/pages/complete_course.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {

  String current_course = 'ongoing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 30.0,bottom: 10.0),
              child: Text('My Courses',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.lightBlue,
                  backgroundColor: Colors.white60,
                  letterSpacing: 2.0
                ),
              ),
            ),
          ),

          OverflowBar(
            children: [
              Container(
                height: 40.0,
                width: 100.0,
                decoration: BoxDecoration(
                  color: current_course == 'enrolled' ? Colors.orange : Colors.grey[200],
                ),
                child: TextButton(
                  child: Text('Enrolled',
                    style: TextStyle(
                      color: current_course == 'enrolled' ? Colors.white : Colors.black,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      current_course = 'enrolled';
                    });
                  },
                ),
              ),
              Container(
                height: 40.0,
                width: 100.0,
                decoration: BoxDecoration(
                  color: current_course == 'ongoing' ? Colors.orange : Colors.grey[200],
                ),
                child: TextButton(
                    child: Text('Ongoing',
                      style: TextStyle(
                        color: current_course == 'ongoing' ? Colors.white : Colors.black,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        current_course = 'ongoing';
                      });
                    }),
              ),
              Container(
                height: 40.0,
                width: 100.0,
                decoration: BoxDecoration(
                  color: current_course == 'completed' ? Colors.orange : Colors.grey[200],
                ),
                child: TextButton(
                    child: Text('Completed',
                      style: TextStyle(
                        color: current_course == 'completed' ? Colors.white : Colors.black,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        current_course = 'completed';
                      });
                    }),
              ),
            ],
            spacing: 30.0,
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
