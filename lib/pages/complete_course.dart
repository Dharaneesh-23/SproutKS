import 'package:flutter/material.dart';
import 'package:sprout_lms/components/course_structure.dart';

class CompleteCourse extends StatefulWidget {
  const CompleteCourse({super.key});

  @override
  State<CompleteCourse> createState() => _CompleteCourseState();
}

class _CompleteCourseState extends State<CompleteCourse> {
  List<CourseStructure> enrolledCourses= [
    CourseStructure(courseAvatar: 'course4.jpg', courseInstructor: 'Jimmy', courseName: 'Java Basic', courseLength: 18, courseStatus: 'Completed', userProgress: 100,courseStartDate: '02/08/2024'),
  ];

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: enrolledCourses.length,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 0.0),
                child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/course',arguments: {
                  "courseTitle" : enrolledCourses[index].courseName,
                  "courseLength":enrolledCourses[index].courseLength,
                  "completionStatus": true,
                });
              },
              title: Text(enrolledCourses[index].courseName,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                ),),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/${enrolledCourses[index].courseAvatar}'),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 05.0),
                child: Text('Instructor: ${enrolledCourses[index].courseInstructor}',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Course Completed on ${enrolledCourses[index].courseStartDate}",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ),
             decoration: BoxDecoration(
               gradient: LinearGradient(colors: [Colors.greenAccent,Colors.green,Colors.green.shade800]),
               borderRadius: BorderRadius.circular(18.0),
             ),
            ),
          );
        },
      );
  }
}
