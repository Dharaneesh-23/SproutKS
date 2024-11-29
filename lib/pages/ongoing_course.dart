import 'package:flutter/material.dart';
import 'package:sprout_lms/components/course_structure.dart';

class OngoingCourse extends StatefulWidget {
  const OngoingCourse({super.key});

  @override
  State<OngoingCourse> createState() => _OngoingCourseState();
}

class _OngoingCourseState extends State<OngoingCourse> {
  List<CourseStructure> onGoingCourses= [
    CourseStructure(courseAvatar: 'course3.jpg', courseInstructor: 'Jimmy', courseName: 'HTML', courseLength: 14, courseStatus: 'Ongoing', userProgress: 8,courseStartDate: '15/05/2024'),
    CourseStructure(courseAvatar: 'course2.jpg', courseInstructor: 'Alex', courseName: 'English Intermidiate', courseLength: 11, courseStatus: 'Ongoing', userProgress: 3,courseStartDate: '28/08/2024'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: onGoingCourses.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 0.0),
            child:ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/course',arguments: {
                  "courseTitle" : onGoingCourses[index].courseName,
                  "courseLength":onGoingCourses[index].courseLength,
                  "completionStatus": false,
                });
              },
              title: Text(onGoingCourses[index].courseName,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                ),),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/${onGoingCourses[index].courseAvatar}'),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 05.0),
                child: Text('Instructor: ${onGoingCourses[index].courseInstructor}',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),),
              ),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("${((onGoingCourses[index].userProgress/onGoingCourses[index].courseLength)*100).toStringAsFixed(1)}%",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),),
                  SizedBox(height: 5), // Optional: Add some space between text and progress bar
                  Container(
                    width: 60, // Adjust the width of the progress bar
                    child: LinearProgressIndicator(
                      value: onGoingCourses[index].userProgress/onGoingCourses[index].courseLength, // Value between 0.0 and 1.0
                      backgroundColor: Colors.grey[300], // Background color of the progress bar
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange), // Color of the progress
                    ),
                  ),
                ],
              ),
            ),
          ),
          color: Colors.blue,
        );
      },
    );
  }
}
